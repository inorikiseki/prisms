# Query Demo

```mysql

-- Querying User's partial information.
select a.id, a.user_id, p.display_name, p.email, p.signature
from account as a
         inner join profile as p
                    on a.id = p.account_id
order by a.id;

```

| id | user_id | display_name | email | signature |
| :--- | :--- | :--- | :--- | :--- |
| 2 | zmj | Minjie | minjie@prism.com | I'm Minjie.  |
| 3 | zhl | Hailin | hailin@prism.com | I'm Hailin.  |

```mysql
-- Querying User's role name.

select a.id, a.user_id, r.name
from account as a
         left join role as r
                   on a.role = r.id;
```

| id | user\_id | name |
| :--- | :--- | :--- |
| 2 | zmj | super |
| 3 | zhl | super |
| 4 | demo | user |
| 5 | Alice | user |


```mysql
-- Querying User's posts.
select a.user_id, pf.display_name, p.title, p.body, p.published_at
from account as a
         inner join profile as pf
                    on a.id = pf.account_id
         inner join post as p
                    on a.id = p.author_id;
```

| user\_id | display\_name | title | body | published\_at |
| :--- | :--- | :--- | :--- | :--- |
| zmj | Minjie | Sleepy | Today, I'm exhausted and sleepy. A cup of coffee doesn't seem to work for me. | 2024-07-13 03:02:51 |
| zhl | Hailin | Milk Tea | Milk tea is delicious. However, it's not healthy to drink a lot.  | 2024-07-13 03:05:58 |
