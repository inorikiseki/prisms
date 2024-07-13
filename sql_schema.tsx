export interface Role {
    id: number;
    name: string;
}

export interface Profile {
    id: number;
    accountId: number;
    displayName: string;
    avatar: string;
    signature: string;
    email: string;
    address: string;
    telephone: string;
}

export interface Account {
    id: number;
    userId: string;
    role: number;
    passwordHash: string;
    createdAt: Date;
}

export interface Follow {
    followId: number;
    followerId: number;
}

export type PostState = 'draft' | 'published' | 'deleted' | 'hide';
export type PostVisibility = 'selfVisible' | 'followerVisible' | 'friendVisible' | 'visible';

export interface Post {
    id: number;
    authorId: number;
    title: string;
    body: string;
    state: PostState;
    visibility: PostVisibility;
    modified: boolean;
    createdAt: Date;
    publishedAt: Date;
    updatedAt: Date;
}

export type ArticleState = 'draft' | 'published' | 'deleted' | 'hide';
export type ArticleVisibility = 'selfVisible' | 'followerVisible' | 'friendVisible' | 'visible';

export interface Article {
    id: number;
    authorId: number;
    title: string;
    summary: string;
    body: string;
    state: ArticleState;
    visibility: ArticleVisibility;
    modified: boolean;
    createdAt: Date;
    publishedAt: Date;
    updatedAt: Date;
}

export type TagType = 'user' | 'post' | 'article' | 'channel' | 'postArticle';

export interface Tag {
    id: number;
    tagType: TagType;
    name: string;
    createdAt: Date;
}

export interface TagPost {
    postId: number;
    tagId: number;
}

export type AttachedType = 'comment' | 'post' | 'message' | 'article';
export type FileType = 'image' | 'video' | 'pdf';

export interface Attachment {
    id: number;
    attachedId: number;
    attachedType: AttachedType;
    fileType: FileType;
    filePath: string;
    createdAt: Date;
}

export type CommentAttachedType = 'post' | 'article';
export type CommentState = 'draft' | 'sent' | 'deleted';

export interface Comment {
    id: number;
    attachedId: number;
    attachedType: CommentAttachedType;
    senderId: number;
    state: CommentState;
    modified: boolean;
    content: string;
    createdAt: Date;
    updatedAt: Date;
}

export type ConversationType = 'personal' | 'channel';

export interface Conversation {
    id: number;
    type: ConversationType;
    createdAt: Date;
}

export interface Message {
    id: number;
    convId: number;
    senderId: number;
    content: string;
    createdAt: Date;
    deliveredAt: Date;
}

export type NotificationType = 'info' | 'warn';

export interface Notification {
    id: number;
    userId: number;
    otherId?: number;
    type: NotificationType;
    title: string;
    body: string;
    createdAt: Date;
    deliveredAt: Date;
}

export type EntityType = 'post' | 'article' | 'comment' | 'message' | 'attachment';

export interface Collection {
    userId: number;
    entityType: EntityType;
    entityId: number;
}

export interface ViewedReceipt {
    userId: number;
    entityType: string;
    entityId: number;
    viewedAt: Date;
}

export type LikeOrDislikeEntityType = 'post' | 'article' | 'comment' | 'attachment';
export type LikeOrDislikeType = 'like' | 'dislike';

export interface LikeOrDislike {
    userId: number;
    entityType: LikeOrDislikeEntityType;
    entityId: number;
    type: LikeOrDislikeType;
    createdAt: Date;
}

export interface UserConv {
    userId: number;
    convId: number;
    remark: string;
}

export interface ChannelInfo {
    id: number;
    convId: number;
    name: string;
    description: string;
}

export type ChannelMemberRole = 'ordinary' | 'admin' | 'master';

export interface ChannelMember {
    channelId: number;
    accountId: number;
    role: ChannelMemberRole;
    displayName: string;
    joinedAt: Date;
    quitAt?: Date;
}

export type PrivacySetting = 'hide' | 'openToPublic' | 'openToFriends';

export interface SettingRecord {
    id: number;
    userId: number;
    privacy: PrivacySetting;
    theme: string;
}
