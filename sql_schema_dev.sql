-- Use the correct database
USE prism;
-- Replace with your actual database name

-- Role Table
CREATE TABLE Role
(
    id   TINYINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Role (name)
VALUES ('super');
INSERT INTO Role (name)
VALUES ('admin');
INSERT INTO Role (name)
VALUES ('member');
INSERT INTO Role (name)
VALUES ('user');
INSERT INTO Role (name)
VALUES ('visitor');

-- Account Table
CREATE TABLE Account
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY, -- Use this only in database.
    user_id       VARCHAR(50) UNIQUE NOT NULL,
    role          TINYINT,
    password_hash VARCHAR(255),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role) REFERENCES Role (id)
);

-- Profile Table
CREATE TABLE Profile
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_id   BIGINT,
    display_name VARCHAR(255),
    avatar       VARCHAR(255) COMMENT 'url',
    signature    TINYTEXT,
    email        VARCHAR(255) UNIQUE NOT NULL,
    address      VARCHAR(255),
    telephone    VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES Account (id)
);

-- Follow Table
CREATE TABLE Follow
(
    follow_id   BIGINT,
    follower_id BIGINT,
    PRIMARY KEY (follow_id, follower_id)
);

-- Post Table
CREATE TABLE Post
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    author_id    BIGINT,
    title        VARCHAR(255),
    body         TEXT,
    state        ENUM ('draft', 'published', 'deleted', 'hide'),
    visibility   ENUM ('selfVisible', 'followerVisible','friendVisible', 'visible'),
    modified     BOOLEAN,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    published_at TIMESTAMP,
    updated_at   TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES Account (id)
);

-- Article Table
CREATE TABLE Article
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    author_id    BIGINT,
    title        VARCHAR(255),
    summary      VARCHAR(255),
    body         TEXT,
    state        ENUM ('draft', 'published', 'deleted', 'hide'),
    visibility   ENUM ('selfVisible', 'followerVisible','friendVisible', 'visible'),
    modified     BOOLEAN,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    published_at TIMESTAMP,
    updated_at   TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES Account (id)
);

-- Tag Table
CREATE TABLE Tag
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    tag_type   ENUM ('user', 'post', 'article', 'channel', 'postArticle'),
    name       VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TagPost Table
CREATE TABLE TagPost
(
    post_id BIGINT,
    tag_id  BIGINT,
    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES Post (id),
    FOREIGN KEY (tag_id) REFERENCES Tag (id)
);

-- TagPost Trigger
DELIMITER //

CREATE TRIGGER check_tag_type
    BEFORE INSERT
    ON TagPost
    FOR EACH ROW
BEGIN
    DECLARE tagType ENUM ('post', 'article');

    -- Fetch the tag_type of the tag_id being inserted
    SELECT tag_type INTO tagType FROM Tag WHERE id = NEW.tag_id;

    -- Check if the tag_type is 'post'
    IF tagType != 'post' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tag_id must have tag_type "post"';
    END IF;
END //

DELIMITER ;

-- Attachment Table
CREATE TABLE Attachment
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    attached_id   BIGINT,
    attached_type ENUM ('comment', 'post', 'message', 'article'),
    file_type     ENUM ('image', 'video', 'pdf'),
    file_path     VARCHAR(255),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Comment Table
CREATE TABLE Comment
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    attached_id   BIGINT,
    attached_type ENUM ('post', 'article'),
    sender_id     BIGINT,
    state         ENUM ('draft', 'sent', 'deleted'),
    modified      BOOLEAN   DEFAULT false,
    content       TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Account (id)
);

-- Conversation Table
CREATE TABLE Conversation
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    type       ENUM ('personal', 'channel'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Message Table
CREATE TABLE Message
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id      BIGINT,
    sender_id    BIGINT,
    content      TEXT,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at TIMESTAMP,
    FOREIGN KEY (conv_id) REFERENCES Conversation (id),
    FOREIGN KEY (sender_id) REFERENCES Account (id)
);

-- Notification Table
CREATE TABLE Notification
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id      BIGINT NOT NULL,
    other_id     BIGINT,
    type         ENUM ('info', 'warn'),
    title        VARCHAR(255),
    body         TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Account (id)
);

-- Collection Table
CREATE TABLE Collection
(
    user_id     BIGINT,
    entity_type ENUM ('post', 'article', 'comment', 'message', 'attachment'),
    entity_id   BIGINT,
    PRIMARY KEY (user_id, entity_type, entity_id)
);

-- Viewed Receipts Table
CREATE TABLE ViewedReceipt
(
    user_id     BIGINT,
    entity_type VARCHAR(50),
    entity_id   BIGINT,
    viewed_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, entity_type, entity_id)
);

-- Like or Dislike Receipts Table
CREATE TABLE LikeOrDislike
(
    user_id     BIGINT,
    entity_type ENUM ('post', 'article', 'comment', 'attachment'),
    entity_id   BIGINT,
    type        ENUM ('like', 'dislike'),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, entity_type, entity_id)
);

-- UserConversations Table
CREATE TABLE UserConv
(
    user_id BIGINT,
    conv_id BIGINT,
    remark  VARCHAR(255),
    PRIMARY KEY (user_id, conv_id),
    FOREIGN KEY (conv_id) REFERENCES Conversation (id)
);

-- ChannelInfo Table
CREATE TABLE ChannelInfo
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id     BIGINT,
    name        VARCHAR(255),
    description TEXT,
    FOREIGN KEY (conv_id) REFERENCES Conversation (id)
);

-- ChannelMember Table
CREATE TABLE ChannelMember
(
    channel_id   BIGINT,
    account_id   BIGINT,
    role         ENUM ('ordinary', 'admin', 'master'),
    display_name VARCHAR(255),
    joined_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quit_at      TIMESTAMP,
    PRIMARY KEY (channel_id, account_id),
    FOREIGN KEY (channel_id) REFERENCES ChannelInfo (id), -- Changed to reference ChannelInfo
    FOREIGN KEY (account_id) REFERENCES Account (id)
);

-- SettingRecord Table
CREATE TABLE SettingRecord
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    privacy ENUM ('hide', 'openToPublic', 'openToFriends'),
    theme   VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Account (id)
);
