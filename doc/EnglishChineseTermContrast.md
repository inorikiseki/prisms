## English Chinese Terminology Contrast Table

Set up a mysql table to help me go through. We can rely on IDEA

```mysql
USE terminology_contrast;

CREATE TABLE terminology
(
    term_id      INT AUTO_INCREMENT PRIMARY KEY,
    english_term VARCHAR(50) NOT NULL,
    chinese_term VARCHAR(50) NOT NULL,
    description  TEXT,
    category     VARCHAR(50)
);

ALTER TABLE terminology
    ADD COLUMN japanese_term VARCHAR(50);

SHOW TABLES;
```

In IntelliJ IDEA, select the above code, right click and run it at your
mysql database.
> **Right Click**  >  I> **Execute**  >  **Select `session`**  >
_Choose-Your-Own_

Operations:

```mysql
-- list all categories. 
SELECT DISTINCT t.category
from terminology as t;
```

| category     |
|:-------------|
| user         |
| post         |
| account      |
| profile      |
| role         |
| message      |
| notification |
| setting      |
| tag          |
| comment      |
| channel      |
| collection   |
| attachment   |

```mysql
-- list all terms included. 
SELECT *
FROM terminology as t
WHERE t.category = ' message  '; -- space !

```

| term\_id | english\_term   | chinese\_term | description | category | japanese\_term |
|:---------|:----------------|:--------------|:------------|:---------|:---------------|
| 94       | Message         | 消息            | 信息          | message  | メッセージ          |
| 95       | Send Message    | 发送消息          | 发信          | message  | メッセージを送る       |
| 96       | Receive Message | 接收消息          | 收信          | message  | メッセージを受け取る     |
| 97       | Inbox           | 收件箱           | 收件箱         | message  | 受信箱            |
| 98       | Outbox          | 发件箱           | 发件箱         | message  | 送信箱            |
| 99       | Draft           | 草稿            | 草稿          | message  | 下書き            |
| 100      | Sent            | 已发送           | 已发送         | message  | 送信済み           |
| 101      | Trash           | 垃圾箱           | 垃圾箱         | message  | ゴミ箱            |
| 102      | Spam            | 垃圾邮件          | 垃圾邮件        | message  | スパム            |
| 103      | Notification    | 通知            | 通知          | message  | 通知             |
| 104      | Read            | 已读            | 已读          | message  | 既読             |
| 105      | Unread          | 未读            | 未读          | message  | 未読             |
| 106      | Reply           | 回复            | 回复          | message  | 返信             |
| 107      | Forward         | 转发            | 转发          | message  | 転送             |
| 108      | Delete          | 删除            | 删除          | message  | 削除             |
| 109      | Archive         | 存档            | 存档          | message  | アーカイブ          |
| 110      | Mark as Read    | 标记为已读         | 标记已读        | message  | 既読にする          |
| 111      | Mark as Unread  | 标记为未读         | 标记未读        | message  | 未読にする          |
| 112      | Star            | 标星            | 加星标         | message  | スター            |
| 113      | Mute            | 静音            | 静音          | message  | ミュート           |
| 114      | Block           | 屏蔽            | 阻止          | message  | ブロック           |
| 115      | Flag            | 标记            | 标记          | message  | フラグ            |

```mysql
SELECT t.category,
       t.english_term,
       t.chinese_term,
       t.japanese_term
FROM terminology as t
ORDER BY t.category;
```

| category     | english\_term             | chinese\_term | japanese\_term  |
|:-------------|:--------------------------|:--------------|:----------------|
| account      | Account                   | 账号            | アカウント           |
| account      | Login                     | 登录            | ログイン            |
| account      | Logout                    | 登出            | ログアウト           |
| account      | Register                  | 注册            | 登録              |
| account      | Username                  | 用户名           | ユーザー名           |
| account      | Email Address             | 邮箱地址          | メールアドレス         |
| account      | Password                  | 密码            | パスワード           |
| account      | Forgot Password           | 忘记密码          | パスワードを忘れた       |
| account      | Reset Password            | 重置密码          | パスワードの再設定       |
| account      | Profile                   | 资料            | プロフィール          |
| account      | Edit Profile              | 编辑资料          | プロフィール編集        |
| account      | Account Settings          | 账号设置          | アカウント設定         |
| account      | Privacy Settings          | 隐私设置          | プライバシー設定        |
| account      | Security Settings         | 安全设置          | セキュリティ設定        |
| account      | Deactivate Account        | 注销账号          | アカウントの無効化       |
| account      | Delete Account            | 删除账号          | アカウントの削除        |
| account      | Two-Factor Authentication | 双因素认证         | 二要素認証           |
| account      | Account Recovery          | 账号恢复          | アカウントの回復        |
| account      | User Agreement            | 用户协议          | 利用規約            |
| account      | Terms of Service          | 服务条款          | サービス利用規約        |
| account      | Privacy Policy            | 隐私政策          | プライバシーポリシ       |
| account      | Account Verification      | 账户验证          | アカウント認証         |
| account      | Linked Accounts           | 关联账号          | 連携アカウント         |
| account      | Session Expiration        | 会话过期          | セッションの期限切れ      |
| account      | Account Activity          | 账号活动          | アカウント活動         |
| attachment   | Attachment                | 附件            | 添付ファイル          |
| attachment   | Add Attachment            | 添加附件          | 添付ファイルを追加       |
| attachment   | Remove Attachment         | 删除附件          | 添付ファイルを削除       |
| attachment   | Download Attachment       | 下载附件          | 添付ファイルをダウンロード   |
| attachment   | View Attachment           | 查看附件          | 添付ファイルを見る       |
| attachment   | Attachment List           | 附件列表          | 添付ファイルリスト       |
| attachment   | Attachment Name           | 附件名称          | 添付ファイル名         |
| attachment   | Attachment Description    | 附件描述          | 添付ファイルの説明       |
| attachment   | Attachment Size           | 附件大小          | 添付ファイルのサイズ      |
| attachment   | Attachment Type           | 附件类型          | 添付ファイルの種類       |
| attachment   | Attachment Settings       | 附件设置          | 添付ファイル設定        |
| attachment   | Attachment Permissions    | 附件权限          | 添付ファイルの権限       |
| attachment   | Attachment Preview        | 附件预览          | 添付ファイルのプレビュー    |
| attachment   | Open Attachment           | 打开附件          | 添付ファイルを開く       |
| attachment   | Edit Attachment           | 编辑附件          | 添付ファイルを編集       |
| attachment   | Attach File               | 附加文件          | ファイルを添付する       |
| attachment   | Email Attachment          | 邮件附件          | メール添付ファイル       |
| attachment   | Attachment Limit          | 附件限制          | 添付ファイルの制限       |
| attachment   | Attachment Upload         | 上传附件          | 添付ファイルをアップロード   |
| attachment   | Attachment Thumbnail      | 附件缩略图         | 添付ファイルのサムネイル    |
| attachment   | Attachment Metadata       | 附件元数据         | 添付ファイルのメタデータ    |
| attachment   | Attachment Status         | 附件状态          | 添付ファイルのステータス    |
| attachment   | Attachment Encryption     | 附件加密          | 添付ファイルの暗号化      |
| attachment   | Manage Attachments        | 管理附件          | 添付ファイルの管理       |
| attachment   | Attachment Expiry         | 附件到期          | 添付ファイルの有効期限     |
| channel      | Channel                   | 频道            | チャンネル           |
| channel      | Create Channel            | 创建频道          | チャンネルを作成        |
| channel      | Delete Channel            | 删除频道          | チャンネルを削除        |
| channel      | Edit Channel              | 编辑频道          | チャンネルを編集        |
| channel      | Join Channel              | 加入频道          | チャンネルに参加        |
| channel      | Leave Channel             | 离开频道          | チャンネルを離れる       |
| channel      | Channel List              | 频道列表          | チャンネルリスト        |
| channel      | Channel Name              | 频道名称          | チャンネル名          |
| channel      | Channel Description       | 频道描述          | チャンネルの説明        |
| channel      | Channel Settings          | 频道设置          | チャンネル設定         |
| channel      | Public Channel            | 公共频道          | 公開チャンネル         |
| channel      | Private Channel           | 私人频道          | プライベートチャンネル     |
| channel      | Channel Members           | 频道成员          | チャンネルメンバー       |
| channel      | Channel Admin             | 频道管理员         | チャンネル管理者        |
| channel      | Channel Notifications     | 频道通知          | チャンネル通知         |
| channel      | Channel History           | 频道历史          | チャンネル履歴         |
| channel      | Channel Activity          | 频道活动          | チャンネルアクティビティ    |
| channel      | Channel Topics            | 频道话题          | チャンネルのトピック      |
| channel      | Active Channel            | 活跃频道          | アクティブなチャンネル     |
| channel      | Favorite Channel          | 收藏频道          | お気に入りチャンネル      |
| channel      | Channel URL               | 频道网址          | チャンネルURL        |
| channel      | Channel Permissions       | 频道权限          | チャンネルの権限        |
| channel      | Channel Role              | 频道角色          | チャンネルの役割        |
| channel      | Channel Integration       | 频道集成          | チャンネルの統合        |
| collection   | Collection                | 集合            | コレクション          |
| collection   | Create Collection         | 创建集合          | コレクションを作成       |
| collection   | Delete Collection         | 删除集合          | コレクションを削除       |
| collection   | Edit Collection           | 编辑集合          | コレクションを編集       |
| collection   | Collection Name           | 集合名称          | コレクション名         |
| collection   | Collection Description    | 集合描述          | コレクションの説明       |
| collection   | View Collection           | 查看集合          | コレクションを見る       |
| collection   | Add to Collection         | 添加到集合         | コレクションに追加する     |
| collection   | Remove from Collection    | 从集合中删除        | コレクションから削除      |
| collection   | Collection Items          | 集合项目          | コレクションアイテム      |
| collection   | Collection List           | 集合列表          | コレクションリスト       |
| collection   | Collection Settings       | 集合设置          | コレクション設定        |
| collection   | Collection Type           | 集合类型          | コレクションタイプ       |
| collection   | Shared Collection         | 共享集合          | 共有コレクション        |
| collection   | Private Collection        | 私人集合          | プライベートコレクション    |
| collection   | Public Collection         | 公共集合          | 公開コレクション        |
| collection   | Favorite Collection       | 收藏集合          | お気に入りコレクション     |
| collection   | Collection Owner          | 集合所有者         | コレクションの所有者      |
| collection   | Collection Permissions    | 集合权限          | コレクションの権限       |
| collection   | Collection History        | 集合历史          | コレクション履歴        |
| collection   | Collection Search         | 集合搜索          | コレクション検索        |
| collection   | Collection Categories     | 集合分类          | コレクションカテゴリ      |
| collection   | Collection Tags           | 集合标签          | コレクションタグ        |
| collection   | Collection Overview       | 集合概览          | コレクションの概要       |
| comment      | Comment                   | 评论            | コメント            |
| comment      | Add Comment               | 添加评论          | コメントを追加         |
| comment      | Edit Comment              | 编辑评论          | コメントを編集         |
| comment      | Delete Comment            | 删除评论          | コメントを削除         |
| comment      | Reply to Comment          | 回复评论          | コメントに返信         |
| comment      | View Comments             | 查看评论          | コメントを見る         |
| comment      | Comment Section           | 评论区           | コメント欄           |
| comment      | Comment Thread            | 评论线程          | コメントスレッド        |
| comment      | Commenter                 | 评论者           | コメント投稿者         |
| comment      | Comment Count             | 评论数           | コメント数           |
| comment      | Comment Moderation        | 评论管理          | コメントの管理         |
| comment      | Flag Comment              | 标记评论          | コメントを報告         |
| comment      | Like Comment              | 点赞评论          | コメントを「いいね！」する   |
| comment      | Dislike Comment           | 踩评论           | コメントを「よくないね！」する |
| comment      | Pin Comment               | 置顶评论          | コメントをピン留め       |
| comment      | Highlight Comment         | 高亮评论          | コメントをハイライト      |
| comment      | Recent Comments           | 最新评论          | 最近のコメント         |
| comment      | Top Comments              | 热门评论          | 人気コメント          |
| comment      | Nested Comments           | 嵌套评论          | ネストされたコメント      |
| comment      | Anonymous Comment         | 匿名评论          | 匿名のコメント         |
| comment      | Comment Policy            | 评论政策          | コメントポリシー        |
| comment      | Comment Form              | 评论表单          | コメントフォーム        |
| message      | Message                   | 消息            | メッセージ           |
| message      | Send Message              | 发送消息          | メッセージを送る        |
| message      | Receive Message           | 接收消息          | メッセージを受け取る      |
| message      | Inbox                     | 收件箱           | 受信箱             |
| message      | Outbox                    | 发件箱           | 送信箱             |
| message      | Draft                     | 草稿            | 下書き             |
| message      | Sent                      | 已发送           | 送信済み            |
| message      | Trash                     | 垃圾箱           | ゴミ箱             |
| message      | Spam                      | 垃圾邮件          | スパム             |
| message      | Notification              | 通知            | 通知              |
| message      | Read                      | 已读            | 既読              |
| message      | Unread                    | 未读            | 未読              |
| message      | Reply                     | 回复            | 返信              |
| message      | Forward                   | 转发            | 転送              |
| message      | Delete                    | 删除            | 削除              |
| message      | Archive                   | 存档            | アーカイブ           |
| message      | Mark as Read              | 标记为已读         | 既読にする           |
| message      | Mark as Unread            | 标记为未读         | 未読にする           |
| message      | Star                      | 标星            | スター             |
| message      | Mute                      | 静音            | ミュート            |
| message      | Block                     | 屏蔽            | ブロック            |
| message      | Flag                      | 标记            | フラグ             |
| notification | Notification              | 通知            | 通知              |
| notification | Push Notification         | 推送通知          | プッシュ通知          |
| notification | Email Notification        | 邮件通知          | メール通知           |
| notification | SMS Notification          | 短信通知          | SMS通知           |
| notification | In-App Notification       | 应用内通知         | アプリ内通知          |
| notification | Alert                     | 警报            | アラート            |
| notification | Reminder                  | 提醒            | リマインダー          |
| notification | System Notification       | 系统通知          | システム通知          |
| notification | Friend Request            | 好友请求          | フレンドリクエスト       |
| notification | Mention                   | 提及            | メンション           |
| notification | Comment                   | 评论            | コメント            |
| notification | Like                      | 点赞            | いいね             |
| notification | Follow                    | 关注            | フォロー            |
| notification | Unfollow                  | 取消关注          | フォロー解除          |
| notification | Message Notification      | 消息通知          | メッセージ通知         |
| notification | News Alert                | 新闻警报          | ニューズアラート        |
| notification | Update Notification       | 更新通知          | 更新通知            |
| notification | Activity Notification     | 活动通知          | アクティビティ通知       |
| notification | Subscription Notification | 订阅通知          | サブスクリプション通知     |
| profile      | Profile                   | 资料            | プロフィール          |
| profile      | Edit Profile              | 编辑资料          | プロフィール編集        |
| profile      | Profile Picture           | 头像            | プロフィール写真        |
| profile      | Cover Photo               | 封面照片          | カバー写真           |
| profile      | Bio                       | 简介            | 自己紹介            |
| profile      | Contact Information       | 联系信息          | 連絡先情報           |
| profile      | Social Media Links        | 社交媒体链接        | ソーシャルメディアリンク    |
| profile      | Interests                 | 兴趣            | 興味              |
| profile      | Occupation                | 职业            | 職業              |
| profile      | Education                 | 教育            | 学歴              |
| profile      | Location                  | 位置            | 場所              |
| profile      | Birthday                  | 生日            | 誕生日             |
| profile      | Gender                    | 性别            | 性別              |
| profile      | Website                   | 网站            | ウェブサイト          |
| profile      | Skills                    | 技能            | スキル             |
| profile      | Certifications            | 证书            | 資格              |
| profile      | Languages                 | 语言            | 言語              |
| profile      | About Me                  | 关于我           | 私について           |
| profile      | Hobbies                   | 爱好            | 趣味              |
| role         | Role                      | 角色            | 役割              |
| role         | Admin                     | 管理员           | 管理者             |
| role         | Moderator                 | 版主            | モデレーター          |
| role         | User                      | 用户            | ユーザー            |
| role         | Guest                     | 访客            | ゲスト             |
| role         | Contributor               | 贡献者           | 貢献者             |
| role         | Editor                    | 编辑            | 編集者             |
| role         | Author                    | 作者            | 著者              |
| role         | Subscriber                | 订阅者           | 購読者             |
| role         | Member                    | 成员            | メンバー            |
| role         | Owner                     | 拥有者           | 所有者             |
| role         | Manager                   | 经理            | マネージャー          |
| role         | Developer                 | 开发者           | 開発者             |
| role         | Operator                  | 操作员           | オペレーター          |
| role         | Supervisor                | 监督员           | 監督者             |
| role         | Analyst                   | 分析师           | アナリスト           |
| role         | Consultant                | 顾问            | コンサルタント         |
| role         | Trainer                   | 培训师           | トレーナー           |
| role         | Intern                    | 实习生           | インターン           |
| setting      | Setting                   | 设置            | 設定              |
| setting      | General Settings          | 常规设置          | 一般設定            |
| setting      | Account Settings          | 账号设置          | アカウント設定         |
| setting      | Privacy Settings          | 隐私设置          | プライバシー設定        |
| setting      | Security Settings         | 安全设置          | セキュリティ設定        |
| setting      | Notification Settings     | 通知设置          | 通知設定            |
| setting      | Language Settings         | 语言设置          | 言語設定            |
| setting      | Display Settings          | 显示设置          | 表示設定            |
| setting      | Sound Settings            | 声音设置          | サウンド設定          |
| setting      | Accessibility Settings    | 辅助功能设置        | アクセシビリティ設定      |
| setting      | Advanced Settings         | 高级设置          | 詳細設定            |
| setting      | Application Settings      | 应用设置          | アプリ設定           |
| setting      | User Settings             | 用户设置          | ユーザー設定          |
| setting      | System Settings           | 系统设置          | システム設定          |
| setting      | Network Settings          | 网络设置          | ネットワーク設定        |
| setting      | Backup Settings           | 备份设置          | バックアップ設定        |
| setting      | Reset Settings            | 重置设置          | 設定のリセット         |
| setting      | Update Settings           | 更新设置          | アップデート設定        |
| setting      | Time Settings             | 时间设置          | 時間設定            |
| tag          | Tag                       | 标签            | タグ              |
| tag          | Add Tag                   | 添加标签          | タグを追加           |
| tag          | Remove Tag                | 删除标签          | タグを削除           |
| tag          | Edit Tag                  | 编辑标签          | タグを編集           |
| tag          | Tag List                  | 标签列表          | タグリスト           |
| tag          | Tag Name                  | 标签名称          | タグ名             |
| tag          | Tag Description           | 标签描述          | タグの説明           |
| tag          | Tag Color                 | 标签颜色          | タグの色            |
| tag          | Tag Management            | 标签管理          | タグ管理            |
| tag          | Assign Tag                | 分配标签          | タグを割り当てる        |
| tag          | Tag Settings              | 标签设置          | タグ設定            |
| tag          | Popular Tags              | 热门标签          | 人気のタグ           |
| tag          | Related Tags              | 相关标签          | 関連タグ            |
| tag          | Filter by Tag             | 按标签筛选         | タグでフィルター        |
| tag          | Tag Cloud                 | 标签云           | タグクラウド          |
| tag          | Search by Tag             | 按标签搜索         | タグで検索           |
| tag          | Tag Category              | 标签类别          | タグカテゴリ          |
| tag          | Tag Suggestions           | 标签建议          | タグの提案           |
| tag          | Tag Hierarchy             | 标签层级          | タグの階層           |
| post         | Post                      | 推文            | ポスト             |
| post         | Like                      | 点赞            | いいね             |
| post         | Dislike                   | 点踩            | 嫌い              |
| post         | Views                     | 浏览数           | 閲覧数             |
| user         | User                      | 用户            | ユーザー            |
| user         | Account                   | 账号            | アカウント           |
| user         | Profile                   | 资料            | プロフィール          |
| user         | Email                     | 邮件            | メール             |
| user         | Address                   | 地址            | アドレス            |
| user         | Telephone                 | 电话号码          | 電話番号            |
| user         | Password                  | 密码            | パスワード           |
