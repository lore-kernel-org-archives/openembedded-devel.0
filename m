Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83BDA77218
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:28:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z194so2941734wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 13:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5dxFfeODAkdYUAi6JIDsMteONdjGDuwc1JRfY1PTvZI=;
	b=x7/nHFQfpXzBHjwBNU4apuiMhpJ9SBGk90qsUCV/hmusq4eHJFbb45VEaBBzL2lhwx
	uWSfn+xqyR8M0mvAPWBtCxgXv8Zi7JyQLt8TtVXWI122dE4tmzWWXQm5bFC0fmHZjCss
	GGeyKItuWCsMeiaoXtu+YfNyvrSQl3+C+BYpX/8O4sYD4WAy4wSQpI9WCUs347zO16XI
	l5IuYAoLmN8kvcK7gdfCvcFB1yedtyfwPgVcNGwVwzvm4QaN+fjLdYxmp0EVmZtlsbHH
	mlwMszmSpuy6sPyNMcsiGukMkb/CQ7dLsuNp1YXxvKloFBKcaRKzggCoSgW8gCUQNGfZ
	jP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5dxFfeODAkdYUAi6JIDsMteONdjGDuwc1JRfY1PTvZI=;
	b=kklXcRysFFuelYycABK+yY5CfaFKxSfqiUryhkXkWruqQrA4Dyesa73ESyABEZPa6o
	o4wZCMwaRMcRWFBxUrXN4N/yi3b7qjQide9jnzEbz1ylcykqtXsfvUXVktRaAgbSu48p
	G+KjL9nlXJ9QbHT1Y2yU/KWJxE1qsNOQJ4725Nkm83w80I+ojsK+Zjo9qHt+Z6q+QJ8o
	IGN41yvNSN4pVpiMc9/7iUOcyCZS995sxHnZE3Jv4glaV1l5tI3leaqhk7hQTaZ9x214
	AODqWFTlyVWJTAIqitr68JVon73Y0W2R12hIoQJ0IYfZo+LYbWfyGMEtYDCXqgCx/67a
	fuLQ==
X-Gm-Message-State: AE9vXwOqXUJVxDcWevYp0kR72X613RvBo0iwhubLcNd1CSU8VD293Jfc+NOXHnnyP+xBdQ==
X-Received: by 10.28.8.84 with SMTP id 81mr12027093wmi.22.1473712131103;
	Mon, 12 Sep 2016 13:28:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w203sm1866798wmw.7.2016.09.12.13.28.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 13:28:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Sep 2016 22:28:53 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160912202853.GC2653@jama>
References: <1470910845-12465-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VzDax14mraLwL8xdiBsz+uFzaL76bDVeMohNZgzvSezA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VzDax14mraLwL8xdiBsz+uFzaL76bDVeMohNZgzvSezA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe][PATCH] syslog-ng: remove unused patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Sep 2016 20:28:52 -0000
X-Groupsio-MsgNum: 63086
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2016 at 12:41:28PM -0700, Andre McCurdy wrote:
> On Thu, Aug 11, 2016 at 3:20 AM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
> > Remove various patches no longer referenced by SRC_URI.
>=20
> Ping.
>=20
> Status is "Accepted" in patchwork, but commit doesn't seem to be in maste=
r.
>=20
>   https://patchwork.openembedded.org/series/1425/

That was incorrectly merked in patchwork, I've just added it to
master-next, thanks for ping.

> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > ---
> >  .../files/afsql-afsql_dd_insert_db-refactor.patch  | 494 -------------=
--------
> >  ...init-the-new-config-when-reverting-to-the.patch |  36 --
> >  .../files/free-global-LogTemplateOptions.patch     |  30 --
> >  .../logwriter-dont-allocate-a-new-buffer.patch     |  26 --
> >  .../rewrite-expr-grammar.ym-Free-up-token.patch    |  17 -
> >  .../files/still-free-the-unconsumed-item.patch     |  90 ----
> >  .../syslog-ng-verify-the-list-before-del.patch     |  38 --
> >  7 files changed, 731 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/afsql-afsql=
_dd_insert_db-refactor.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/deinit-the-=
new-config-when-reverting-to-the.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/free-global=
-LogTemplateOptions.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-d=
ont-allocate-a-new-buffer.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/rewrite-exp=
r-grammar.ym-Free-up-token.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/still-free-=
the-unconsumed-item.patch
> >  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-v=
erify-the-list-before-del.patch
> >
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_ins=
ert_db-refactor.patch b/meta-oe/recipes-support/syslog-ng/files/afsql-afsql=
_dd_insert_db-refactor.patch
> > deleted file mode 100644
> > index 42e181b..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-=
refactor.patch
> > +++ /dev/null
> > @@ -1,494 +0,0 @@
> > -From 23e80b75508187baaa823a68ea019b72e0b2305c Mon Sep 17 00:00:00 2001
> > -From: Budai Laszlo <lbudai@balabit.hu>
> > -Date: Tue, 12 Nov 2013 13:19:04 +0100
> > -Subject: [PATCH] afsql: afsql_dd_insert_db() refactor
> > -
> > -Upstream-Status: Backport
> > -
> > -A lot of the code that was previously in afsql_dd_insert_db() have been
> > -extracted to smaller functions, and afsql_dd_insert_db() was rebuilt on
> > -top of these. At the same time, memory leaks were plugged, and in case
> > -of a transaction error, backlog rewinding has been fixed too, to not
> > -loose messages since the last BEGIN command.
> > -
> > -Signed-off-by: Juhasz Viktor <jviktor@balabit.hu>
> > -Signed-off-by: Laszlo Budai <lbudai@balabit.hu>
> > ----
> > - modules/afsql/afsql.c | 301 ++++++++++++++++++++++++++++++++---------=
---------
> > - 1 file changed, 192 insertions(+), 109 deletions(-)
> > -
> > -diff --git a/modules/afsql/afsql.c b/modules/afsql/afsql.c
> > -index 12f6aab..a6a8190 100644
> > ---- a/modules/afsql/afsql.c
> > -+++ b/modules/afsql/afsql.c
> > -@@ -456,24 +456,21 @@ afsql_dd_create_index(AFSqlDestDriver *s
> > -  *
> > -  * NOTE: This function can only be called from the database thread.
> > -  **/
> > --static GString *
> > --afsql_dd_validate_table(AFSqlDestDriver *self, LogMessage *msg)
> > -+static gboolean
> > -+afsql_dd_validate_table(AFSqlDestDriver *self, GString *table)
> > - {
> > --  GString *query_string, *table;
> > -+  GString *query_string;
> > -   dbi_result db_res;
> > -   gboolean success =3D FALSE;
> > -   gint i;
> > -
> > --  table =3D g_string_sized_new(32);
> > --  log_template_format(self->table, msg, &self->template_options, LTZ_=
LOCAL, 0, NULL, table);
> > --
> > -   if (self->flags & AFSQL_DDF_DONT_CREATE_TABLES)
> > --    return table;
> > -+    return TRUE;
> > -
> > -   afsql_dd_check_sql_identifier(table->str, TRUE);
> > -
> > -   if (g_hash_table_lookup(self->validated_tables, table->str))
> > --    return table;
> > -+    return TRUE;
> > -
> > -   query_string =3D g_string_sized_new(32);
> > -   g_string_printf(query_string, "SELECT * FROM %s WHERE 0=3D1", table=
->str);
> > -@@ -544,14 +541,9 @@ afsql_dd_validate_table(AFSqlDestDriver
> > -       /* we have successfully created/altered the destination table, =
record this information */
> > -       g_hash_table_insert(self->validated_tables, g_strdup(table->str=
), GUINT_TO_POINTER(TRUE));
> > -     }
> > --  else
> > --    {
> > --      g_string_free(table, TRUE);
> > --      table =3D NULL;
> > --    }
> > -   g_string_free(query_string, TRUE);
> > -
> > --  return table;
> > -+  return success;
> > - }
> > -
> > - /**
> > -@@ -581,6 +573,20 @@ afsql_dd_begin_txn(AFSqlDestDriver *self
> > - }
> > -
> > - /**
> > -+ * afsql_dd_handle_transaction_error:
> > -+ *
> > -+ * Handle errors inside during a SQL transaction (e.g. INSERT or COMM=
IT failures).
> > -+ *
> > -+ * NOTE: This function can only be called from the database thread.
> > -+ **/
> > -+static void
> > -+afsql_dd_handle_transaction_error(AFSqlDestDriver *self)
> > -+{
> > -+  log_queue_rewind_backlog(self->queue);
> > -+  self->flush_lines_queued =3D 0;
> > -+}
> > -+
> > -+/**
> > -  * afsql_dd_begin_txn:
> > -  *
> > -  * Commit SQL transaction.
> > -@@ -596,14 +602,14 @@ afsql_dd_commit_txn(AFSqlDestDriver *sel
> > -   if (success)
> > -     {
> > -       log_queue_ack_backlog(self->queue, self->flush_lines_queued);
> > -+      self->flush_lines_queued =3D 0;
> > -     }
> > -   else
> > -     {
> > --      msg_notice("SQL transaction commit failed, rewinding backlog an=
d starting again",
> > --                 NULL);
> > --      log_queue_rewind_backlog(self->queue);
> > -+      msg_error("SQL transaction commit failed, rewinding backlog and=
 starting again",
> > -+                NULL);
> > -+      afsql_dd_handle_transaction_error(self);
> > -     }
> > --  self->flush_lines_queued =3D 0;
> > -   return success;
> > - }
> > -
> > -@@ -644,12 +650,13 @@ afsql_dd_set_dbd_opt_numeric(gpointer ke
> > - }
> > -
> > - static gboolean
> > --afsql_dd_connect(AFSqlDestDriver *self)
> > -+afsql_dd_ensure_initialized_connection(AFSqlDestDriver *self)
> > - {
> > -   if (self->dbi_ctx)
> > -     return TRUE;
> > -
> > -   self->dbi_ctx =3D dbi_conn_new(self->type);
> > -+
> > -   if (!self->dbi_ctx)
> > -     {
> > -       msg_error("No such DBI driver",
> > -@@ -659,10 +666,12 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > -     }
> > -
> > -   dbi_conn_set_option(self->dbi_ctx, "host", self->host);
> > -+
> > -   if (strcmp(self->type, "mysql"))
> > -     dbi_conn_set_option(self->dbi_ctx, "port", self->port);
> > -   else
> > -     dbi_conn_set_option_numeric(self->dbi_ctx, "port", atoi(self->por=
t));
> > -+
> > -   dbi_conn_set_option(self->dbi_ctx, "username", self->user);
> > -   dbi_conn_set_option(self->dbi_ctx, "password", self->password);
> > -   dbi_conn_set_option(self->dbi_ctx, "dbname", self->database);
> > -@@ -691,6 +700,7 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > -                 evt_tag_str("database", self->database),
> > -                 evt_tag_str("error", dbi_error),
> > -                 NULL);
> > -+
> > -       return FALSE;
> > -     }
> > -
> > -@@ -713,104 +723,145 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > -   return TRUE;
> > - }
> > -
> > --static gboolean
> > --afsql_dd_insert_fail_handler(AFSqlDestDriver *self, LogMessage *msg,
> > --                             LogPathOptions *path_options)
> > -+static GString *
> > -+afsql_dd_ensure_accessible_database_table(AFSqlDestDriver *self, LogM=
essage *msg)
> > - {
> > --  if (self->failed_message_counter < self->num_retries - 1)
> > --    {
> > --      log_queue_push_head(self->queue, msg, path_options);
> > --
> > --      /* database connection status sanity check after failed query */
> > --      if (dbi_conn_ping(self->dbi_ctx) !=3D 1)
> > --        {
> > --          const gchar *dbi_error;
> > --
> > --          dbi_conn_error(self->dbi_ctx, &dbi_error);
> > --          msg_error("Error, no SQL connection after failed query atte=
mpt",
> > --                    evt_tag_str("type", self->type),
> > --                    evt_tag_str("host", self->host),
> > --                    evt_tag_str("port", self->port),
> > --                    evt_tag_str("username", self->user),
> > --                    evt_tag_str("database", self->database),
> > --                    evt_tag_str("error", dbi_error),
> > --                    NULL);
> > --          return FALSE;
> > --        }
> > -+  GString *table =3D g_string_sized_new(32);
> > -+  log_template_format(self->table, msg, &self->template_options, LTZ_=
LOCAL, 0, NULL, table);
> > -
> > --      self->failed_message_counter++;
> > --      return FALSE;
> > -+  if (!afsql_dd_validate_table(self, table))
> > -+    {
> > -+      /* If validate table is FALSE then close the connection and wai=
t time_reopen time (next call) */
> > -+      msg_error("Error checking table, disconnecting from database, t=
rying again shortly",
> > -+                evt_tag_int("time_reopen", self->time_reopen),
> > -+                NULL);
> > -+      g_string_free(table, TRUE);
> > -+      return NULL;
> > -     }
> > -
> > --  msg_error("Multiple failures while inserting this record into the d=
atabase, message dropped",
> > --            evt_tag_int("attempts", self->num_retries),
> > --            NULL);
> > --  stats_counter_inc(self->dropped_messages);
> > --  log_msg_drop(msg, path_options);
> > --  self->failed_message_counter =3D 0;
> > --  return TRUE;
> > -+  return table;
> > - }
> > -
> > - static GString *
> > --afsql_dd_construct_query(AFSqlDestDriver *self, GString *table,
> > --                         LogMessage *msg)
> > -+afsql_dd_build_insert_command(AFSqlDestDriver *self, LogMessage *msg,=
 GString *table)
> > - {
> > --  GString *value;
> > --  GString *query_string;
> > --  gint i;
> > -+  GString *insert_command =3D g_string_sized_new(256);
> > -+  GString *value =3D g_string_sized_new(512);
> > -+  gint i, j;
> > -
> > --  value =3D g_string_sized_new(256);
> > --  query_string =3D g_string_sized_new(512);
> > -+  g_string_printf(insert_command, "INSERT INTO %s (", table->str);
> > -
> > --  g_string_printf(query_string, "INSERT INTO %s (", table->str);
> > -   for (i =3D 0; i < self->fields_len; i++)
> > -     {
> > --      g_string_append(query_string, self->fields[i].name);
> > --      if (i !=3D self->fields_len - 1)
> > --        g_string_append(query_string, ", ");
> > -+      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) =3D=3D 0 && self=
->fields[i].value !=3D NULL)
> > -+        {
> > -+           g_string_append(insert_command, self->fields[i].name);
> > -+
> > -+           j =3D i + 1;
> > -+           while (j < self->fields_len && (self->fields[j].flags & AF=
SQL_FF_DEFAULT) =3D=3D AFSQL_FF_DEFAULT)
> > -+             j++;
> > -+
> > -+           if (j < self->fields_len)
> > -+             g_string_append(insert_command, ", ");
> > -+        }
> > -     }
> > --  g_string_append(query_string, ") VALUES (");
> > -+
> > -+  g_string_append(insert_command, ") VALUES (");
> > -
> > -   for (i =3D 0; i < self->fields_len; i++)
> > -     {
> > -       gchar *quoted;
> > -
> > --      if (self->fields[i].value =3D=3D NULL)
> > --        {
> > --          /* the config used the 'default' value for this column -> t=
he fields[i].value is NULL, use SQL default */
> > --          g_string_append(query_string, "DEFAULT");
> > --        }
> > --      else
> > -+      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) =3D=3D 0 && self=
->fields[i].value !=3D NULL)
> > -         {
> > -           log_template_format(self->fields[i].value, msg, &self->temp=
late_options, LTZ_SEND, self->seq_num, NULL, value);
> > --
> > -           if (self->null_value && strcmp(self->null_value, value->str=
) =3D=3D 0)
> > -             {
> > --              g_string_append(query_string, "NULL");
> > -+              g_string_append(insert_command, "NULL");
> > -             }
> > -           else
> > -             {
> > -               dbi_conn_quote_string_copy(self->dbi_ctx, value->str, &=
quoted);
> > -               if (quoted)
> > -                 {
> > --                  g_string_append(query_string, quoted);
> > -+                  g_string_append(insert_command, quoted);
> > -                   free(quoted);
> > -                 }
> > -               else
> > -                 {
> > --                  g_string_append(query_string, "''");
> > -+                 g_string_append(insert_command, "''");
> > -                 }
> > -             }
> > --        }
> > -
> > --      if (i !=3D self->fields_len - 1)
> > --        g_string_append(query_string, ", ");
> > -+          j =3D i + 1;
> > -+          while (j < self->fields_len && (self->fields[j].flags & AFS=
QL_FF_DEFAULT) =3D=3D AFSQL_FF_DEFAULT)
> > -+            j++;
> > -+          if (j < self->fields_len)
> > -+            g_string_append(insert_command, ", ");
> > -+        }
> > -     }
> > --  g_string_append(query_string, ")");
> > -+
> > -+  g_string_append(insert_command, ")");
> > -
> > -   g_string_free(value, TRUE);
> > -
> > --  return query_string;
> > -+  return insert_command;
> > -+}
> > -+
> > -+static inline gboolean
> > -+afsql_dd_is_transaction_handling_enabled(const AFSqlDestDriver *self)
> > -+{
> > -+  return self->flush_lines_queued !=3D -1;
> > -+}
> > -+
> > -+static inline gboolean
> > -+afsql_dd_should_start_new_transaction(const AFSqlDestDriver *self)
> > -+{
> > -+  return self->flush_lines_queued =3D=3D 0;
> > -+}
> > -+
> > -+static inline gboolean
> > -+afsql_dd_should_commit_transaction(const AFSqlDestDriver *self)
> > -+{
> > -+  return afsql_dd_is_transaction_handling_enabled(self) && self->flus=
h_lines_queued =3D=3D self->flush_lines;
> > -+}
> > -+
> > -+static inline gboolean
> > -+afsql_dd_handle_insert_row_error_depending_on_connection_availability=
(AFSqlDestDriver *self,
> > -+                                                                     =
 LogMessage *msg,
> > -+                                                                     =
 LogPathOptions *path_options)
> > -+{
> > -+  const gchar *dbi_error, *error_message;
> > -+
> > -+  if (dbi_conn_ping(self->dbi_ctx) =3D=3D 1)
> > -+    {
> > -+      log_queue_push_head(self->queue, msg, path_options);
> > -+      return TRUE;
> > -+    }
> > -+
> > -+  if (afsql_dd_is_transaction_handling_enabled(self))
> > -+    {
> > -+      error_message =3D "SQL connection lost in the middle of a trans=
action,"
> > -+                      " rewinding backlog and starting again";
> > -+      afsql_dd_handle_transaction_error(self);
> > -+    }
> > -+  else
> > -+    {
> > -+      error_message =3D "Error, no SQL connection after failed query =
attempt";
> > -+      log_queue_push_head(self->queue, msg, path_options);
> > -+    }
> > -+
> > -+  dbi_conn_error(self->dbi_ctx, &dbi_error);
> > -+  msg_error(error_message,
> > -+            evt_tag_str("type", self->type),
> > -+            evt_tag_str("host", self->host),
> > -+            evt_tag_str("port", self->port),
> > -+            evt_tag_str("username", self->user),
> > -+            evt_tag_str("database", self->database),
> > -+            evt_tag_str("error", dbi_error),
> > -+            NULL);
> > -+
> > -+  return FALSE;
> > - }
> > -
> > - /**
> > -@@ -824,61 +875,93 @@ afsql_dd_construct_query(AFSqlDestDriver
> > - static gboolean
> > - afsql_dd_insert_db(AFSqlDestDriver *self)
> > - {
> > --  GString *table, *query_string;
> > -+  GString *table =3D NULL;
> > -+  GString *insert_command =3D NULL;
> > -   LogMessage *msg;
> > -   gboolean success;
> > -   LogPathOptions path_options =3D LOG_PATH_OPTIONS_INIT;
> > -
> > --  afsql_dd_connect(self);
> > -+  if (!afsql_dd_ensure_initialized_connection(self))
> > -+    return FALSE;
> > -
> > --  success =3D log_queue_pop_head(self->queue, &msg, &path_options, (s=
elf->flags & AFSQL_DDF_EXPLICIT_COMMITS), FALSE);
> > -+  /* connection established, try to insert a message */
> > -+  success =3D log_queue_pop_head(self->queue, &msg, &path_options, FA=
LSE, self->flags & AFSQL_DDF_EXPLICIT_COMMITS);
> > -   if (!success)
> > -     return TRUE;
> > -
> > -   msg_set_context(msg);
> > -
> > --  table =3D afsql_dd_validate_table(self, msg);
> > -+  table =3D afsql_dd_ensure_accessible_database_table(self, msg);
> > -+
> > -   if (!table)
> > -     {
> > --      /* If validate table is FALSE then close the connection and wai=
t time_reopen time (next call) */
> > --      msg_error("Error checking table, disconnecting from database, t=
rying again shortly",
> > --                evt_tag_int("time_reopen", self->time_reopen),
> > --                NULL);
> > --      msg_set_context(NULL);
> > --      g_string_free(table, TRUE);
> > --      return afsql_dd_insert_fail_handler(self, msg, &path_options);
> > -+      success =3D FALSE;
> > -+      goto out;
> > -     }
> > -
> > --  query_string =3D afsql_dd_construct_query(self, table, msg);
> > -+  if (afsql_dd_should_start_new_transaction(self) && !afsql_dd_begin_=
txn(self))
> > -+    {
> > -+      success =3D FALSE;
> > -+      goto out;
> > -+    }
> > -
> > --  if (self->flush_lines_queued =3D=3D 0 && !afsql_dd_begin_txn(self))
> > --    return FALSE;
> > -+  insert_command =3D afsql_dd_build_insert_command(self, msg, table);
> > -+  success =3D afsql_dd_run_query(self, insert_command->str, FALSE, NU=
LL);
> > -
> > --  success =3D afsql_dd_run_query(self, query_string->str, FALSE, NULL=
);
> > -   if (success && self->flush_lines_queued !=3D -1)
> > -     {
> > -       self->flush_lines_queued++;
> > -
> > --      if (self->flush_lines && self->flush_lines_queued =3D=3D self->=
flush_lines && !afsql_dd_commit_txn(self))
> > --        return FALSE;
> > -+      if (afsql_dd_should_commit_transaction(self) && !afsql_dd_commi=
t_txn(self))
> > -+        {
> > -+          /* Assuming that in case of error, the queue is rewound by =
afsql_dd_commit_txn() */
> > -+
> > -+          g_string_free(insert_command, TRUE);
> > -+          msg_set_context(NULL);
> > -+
> > -+          return FALSE;
> > -+        }
> > -     }
> > -
> > --  g_string_free(table, TRUE);
> > --  g_string_free(query_string, TRUE);
> > -+ out:
> > -+
> > -+  if (table !=3D NULL)
> > -+    g_string_free(table, TRUE);
> > -+
> > -+  if (insert_command !=3D NULL)
> > -+    g_string_free(insert_command, TRUE);
> > -
> > -   msg_set_context(NULL);
> > -
> > --  if (!success)
> > --    return afsql_dd_insert_fail_handler(self, msg, &path_options);
> > -+  if (success)
> > -+    {
> > -+      log_msg_ack(msg, &path_options);
> > -+      log_msg_unref(msg);
> > -+      step_sequence_number(&self->seq_num);
> > -+      self->failed_message_counter =3D 0;
> > -+    }
> > -+  else
> > -+    {
> > -+      if (self->failed_message_counter < self->num_retries - 1)
> > -+        {
> > -+          if (!afsql_dd_handle_insert_row_error_depending_on_connecti=
on_availability(self, msg, &path_options))
> > -+            return FALSE;
> > -
> > --  /* we only ACK if each INSERT is a separate transaction */
> > --  if ((self->flags & AFSQL_DDF_EXPLICIT_COMMITS) =3D=3D 0)
> > --    log_msg_ack(msg, &path_options);
> > --  log_msg_unref(msg);
> > --  step_sequence_number(&self->seq_num);
> > --  self->failed_message_counter =3D 0;
> > -+          self->failed_message_counter++;
> > -+        }
> > -+      else
> > -+        {
> > -+          msg_error("Multiple failures while inserting this record in=
to the database, message dropped",
> > -+                    evt_tag_int("attempts", self->num_retries),
> > -+                    NULL);
> > -+          stats_counter_inc(self->dropped_messages);
> > -+          log_msg_drop(msg, &path_options);
> > -+          self->failed_message_counter =3D 0;
> > -+          success =3D TRUE;
> > -+        }
> > -+    }
> > -
> > --  return TRUE;
> > -+  return success;
> > - }
> > -
> > - static void
> > -@@ -895,7 +978,7 @@ afsql_dd_message_became_available_in_the
> > - static void
> > - afsql_dd_wait_for_suspension_wakeup(AFSqlDestDriver *self)
> > - {
> > --  /* we got suspended, probably because of a connection error,
> > -+  /* we got suspended, probably because of a connection error,
> > -    * during this time we only get wakeups if we need to be
> > -    * terminated. */
> > -   if (!self->db_thread_terminate)
> > -@@ -974,8 +1057,7 @@ afsql_dd_database_thread(gpointer arg)
> > -
> > -       afsql_dd_commit_txn(self);
> > -     }
> > --
> > -- exit:
> > -+exit:
> > -   afsql_dd_disconnect(self);
> > -
> > -   msg_verbose("Database thread finished",
> > ---
> > -1.8.4.1
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/deinit-the-new-con=
fig-when-reverting-to-the.patch b/meta-oe/recipes-support/syslog-ng/files/d=
einit-the-new-config-when-reverting-to-the.patch
> > deleted file mode 100644
> > index 484af7e..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-whe=
n-reverting-to-the.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 86842df8bff5c97e44fc55d2fb7fc6c10f56ab84 Mon Sep 17 00:00:00 2001
> > -From: Gergely Nagy <algernon@balabit.hu>
> > -Date: Fri, 13 Dec 2013 13:46:15 +0100
> > -Subject: [PATCH] mainloop: Deinit the new config when reverting to the=
 old one
> > -
> > -Upstream-Status: Backport
> > -
> > -When reloading, and the new config fails, deinit it before initializing
> > -the old config. This is so that conflicting things do not remain held =
by
> > -the half-initialized new config, while the old tries to take it
> > -over. (It also removed a couple of memory leaks, most likely.)
> > -
> > -The reason we can do this, is because cfg_tree_stop() (called by
> > -cfg_deinit()) goes over all the known nodes, and log_pipe_deinit() is
> > -also smart enough to not deinit a node that has not been inited before.
> > -
> > -Signed-off-by: Gergely Nagy <algernon@balabit.hu>
> > ----
> > - lib/mainloop.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/lib/mainloop.c b/lib/mainloop.c
> > -index 34655fa..e6fbb59 100644
> > ---- a/lib/mainloop.c
> > -+++ b/lib/mainloop.c
> > -@@ -510,6 +510,7 @@ main_loop_reload_config_apply(void)
> > -     {
> > -       msg_error("Error initializing new configuration, reverting to o=
ld config", NULL);
> > -       cfg_persist_config_move(main_loop_new_config, main_loop_old_con=
fig);
> > -+      cfg_deinit(main_loop_new_config);
> > -       if (!cfg_init(main_loop_old_config))
> > -         {
> > -           /* hmm. hmmm, error reinitializing old configuration, we're=
 hosed.
> > ---
> > -1.8.4.1
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/free-global-LogTem=
plateOptions.patch b/meta-oe/recipes-support/syslog-ng/files/free-global-Lo=
gTemplateOptions.patch
> > deleted file mode 100644
> > index d439a26..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOp=
tions.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From 3ef6ca8044260c77118edca6dead807a2edcb5ef Mon Sep 17 00:00:00 2001
> > -From: Balazs Scheidler <bazsi@balabit.hu>
> > -Date: Thu, 31 Oct 2013 13:20:12 +0100
> > -Subject: [PATCH] cfg: free global LogTemplateOptions
> > -
> > -Upstream-Status: Backport
> > -
> > -This fixes a potential memory leak when global template specific
> > -options were specified, such as local-time-zone(), send-time-zone() et=
c.
> > -
> > -Signed-off-by: Balazs Scheidler <bazsi@balabit.hu>
> > ----
> > - lib/cfg.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/lib/cfg.c b/lib/cfg.c
> > -index 7f040b8..adeaaf8 100644
> > ---- a/lib/cfg.c
> > -+++ b/lib/cfg.c
> > -@@ -411,6 +411,7 @@ cfg_free(GlobalConfig *self)
> > -   g_free(self->proto_template_name);
> > -   log_template_unref(self->file_template);
> > -   log_template_unref(self->proto_template);
> > -+  log_template_options_destroy(&self->template_options);
> > -
> > -   if (self->bad_hostname_compiled)
> > -     regfree(&self->bad_hostname);
> > ---
> > -1.8.4.1
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/logwriter-dont-all=
ocate-a-new-buffer.patch b/meta-oe/recipes-support/syslog-ng/files/logwrite=
r-dont-allocate-a-new-buffer.patch
> > deleted file mode 100644
> > index 9e3d64b..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a=
-new-buffer.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -logwriter: Don't allocate a new buffer if fails to consume current item
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > ----
> > ---- a/lib/logwriter.c
> > -+++ b/lib/logwriter.c
> > -@@ -1010,7 +1010,7 @@
> > -         {
> > -           status =3D log_proto_client_post(proto, (guchar *) self->li=
ne_buffer->str, self->line_buffer->len, &consumed);
> > -
> > --          if (consumed)
> > -+          if (consumed && status !=3D LPS_ERROR)
> > -             log_writer_realloc_line_buffer(self);
> > -
> > -           if (status =3D=3D LPS_ERROR)
> > -@@ -1028,7 +1028,7 @@
> > -                     NULL);
> > -           consumed =3D TRUE;
> > -         }
> > --      if (consumed)
> > -+      if (consumed && status !=3D LPS_ERROR)
> > -         {
> > -           if (lm->flags & LF_LOCAL)
> > -             step_sequence_number(&self->seq_num);
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/rewrite-expr-gramm=
ar.ym-Free-up-token.patch b/meta-oe/recipes-support/syslog-ng/files/rewrite=
-expr-grammar.ym-Free-up-token.patch
> > deleted file mode 100644
> > index 1951af9..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-F=
ree-up-token.patch
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -rewrite-expr-grammar.ym: Free up token.
> > -
> > -Upsteam-Status: Backport
> > -
> > -Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > -Signed-off-by: Viktor Tusa <tusavik@gmail.com>
> > ----
> > ---- a/lib/rewrite/rewrite-expr-grammar.ym
> > -+++ b/lib/rewrite/rewrite-expr-grammar.ym
> > -@@ -78,6 +78,7 @@
> > -
> > -           $$ =3D log_template_new(configuration, $1);
> > -           CHECK_ERROR(log_template_compile($$, $1, &error), @1, "Erro=
r compiling template (%s)", error->message);
> > -+            free($1);
> > -         }
> > -       ;
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/still-free-the-unc=
onsumed-item.patch b/meta-oe/recipes-support/syslog-ng/files/still-free-the=
-unconsumed-item.patch
> > deleted file mode 100644
> > index ea18682..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed=
-item.patch
> > +++ /dev/null
> > @@ -1,90 +0,0 @@
> > -From 365020c5c0823c91a8011e34597f970a7cfb4fb3 Mon Sep 17 00:00:00 2001
> > -From: Tusa Viktor <tusavik@gmail.com>
> > -Date: Wed, 23 Apr 2014 17:10:58 +0000
> > -Subject: [PATCH] logwriter: still free the unconsumed item during relo=
ading
> > - configuration
> > -
> > -Upstream-Status: Backport
> > -
> > -Otherwise we have no chance to free this stuff.
> > -
> > -Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > -Signed-off-by: Tusa Viktor <tusavik@gmail.com>
> > -Signed-off-by: Gergely Nagy <algernon@madhouse-project.org>
> > ----
> > - lib/logproto/logproto-client.h      |    2 +-
> > - lib/logproto/logproto-text-client.c |   11 +++++++++++
> > - lib/logwriter.c                     |    9 +++++++--
> > - 3 files changed, 19 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/lib/logproto/logproto-client.h b/lib/logproto/logproto-cl=
ient.h
> > -index 254ecf9..5adc917 100644
> > ---- a/lib/logproto/logproto-client.h
> > -+++ b/lib/logproto/logproto-client.h
> > -@@ -47,7 +47,6 @@ void log_proto_client_options_defaults(LogProtoClien=
tOptions *options);
> > - void log_proto_client_options_init(LogProtoClientOptions *options, Gl=
obalConfig *cfg);
> > - void log_proto_client_options_destroy(LogProtoClientOptions *options);
> > -
> > --
> > - struct _LogProtoClient
> > - {
> > -   LogProtoStatus status;
> > -@@ -107,6 +106,7 @@ log_proto_client_reset_error(LogProtoClient *s)
> > - gboolean log_proto_client_validate_options(LogProtoClient *self);
> > - void log_proto_client_init(LogProtoClient *s, LogTransport *transport=
, const LogProtoClientOptions *options);
> > - void log_proto_client_free(LogProtoClient *s);
> > -+void log_proto_client_free_method(LogProtoClient *s);
> > -
> > - #define DEFINE_LOG_PROTO_CLIENT(prefix) \
> > -   static gpointer                                                    =
   \
> > -diff --git a/lib/logproto/logproto-text-client.c b/lib/logproto/logpro=
to-text-client.c
> > -index 3248759..a5100f3 100644
> > ---- a/lib/logproto/logproto-text-client.c
> > -+++ b/lib/logproto/logproto-text-client.c
> > -@@ -146,12 +146,23 @@ log_proto_text_client_post(LogProtoClient *s, gu=
char *msg, gsize msg_len, gboole
> > - }
> > -
> > - void
> > -+log_proto_text_client_free(LogProtoClient *s)
> > -+{
> > -+  LogProtoTextClient *self =3D (LogProtoTextClient *)s;
> > -+  if (self->partial_free)
> > -+    self->partial_free(self->partial);
> > -+  self->partial =3D NULL;
> > -+  log_proto_client_free_method(s);
> > -+};
> > -+
> > -+void
> > - log_proto_text_client_init(LogProtoTextClient *self, LogTransport *tr=
ansport, const LogProtoClientOptions *options)
> > - {
> > -   log_proto_client_init(&self->super, transport, options);
> > -   self->super.prepare =3D log_proto_text_client_prepare;
> > -   self->super.flush =3D log_proto_text_client_flush;
> > -   self->super.post =3D log_proto_text_client_post;
> > -+  self->super.free_fn =3D log_proto_text_client_free;
> > -   self->super.transport =3D transport;
> > -   self->next_state =3D -1;
> > - }
> > -diff --git a/lib/logwriter.c b/lib/logwriter.c
> > -index 3292e31..470bcdb 100644
> > ---- a/lib/logwriter.c
> > -+++ b/lib/logwriter.c
> > -@@ -1063,8 +1063,13 @@ log_writer_flush(LogWriter *self, LogWriterFlus=
hMode flush_mode)
> > -         }
> > -       else
> > -         {
> > --          /* push back to the queue */
> > --          log_queue_push_head(self->queue, lm, &path_options);
> > -+          if (flush_mode =3D=3D LW_FLUSH_QUEUE)
> > -+            log_msg_unref(lm);
> > -+          else
> > -+            {
> > -+              /* push back to the queue */
> > -+              log_queue_push_head(self->queue, lm, &path_options);
> > -+            }
> > -           msg_set_context(NULL);
> > -           log_msg_refcache_stop();
> > -           break;
> > ---
> > -1.7.10.4
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-t=
he-list-before-del.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-n=
g-verify-the-list-before-del.patch
> > deleted file mode 100644
> > index e8119b8..0000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list=
-before-del.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -Verify the validity of the pointer before delete it
> > -
> > -Otherwise, we got a crash at logqueue-fifo.c:344
> > -  344 iv_list_del(&node->list);
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > ----
> > ---- a/lib/logqueue-fifo.c
> > -+++ b/lib/logqueue-fifo.c
> > -@@ -339,15 +339,18 @@
> > -       *msg =3D node->msg;
> > -       path_options->ack_needed =3D node->ack_needed;
> > -       self->qoverflow_output_len--;
> > --      if (!push_to_backlog)
> > -+      if ((&node->list) && (&node->list)->next && (&node->list)->prev)
> > -         {
> > --          iv_list_del(&node->list);
> > --          log_msg_free_queue_node(node);
> > --        }
> > --      else
> > --        {
> > --          iv_list_del_init(&node->list);
> > --        }
> > -+          if (!push_to_backlog)
> > -+            {
> > -+              iv_list_del(&node->list);
> > -+              log_msg_free_queue_node(node);
> > -+            }
> > -+          else
> > -+            {
> > -+              iv_list_del_init(&node->list);
> > -+            }
> > -+        }
> > -     }
> > -   else
> > -     {
> > --
> > 1.9.1
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfXEAQACgkQN1Ujt2V2gBxM/ACeJWNdd4WVkFgvrANRfde6xu2h
hJIAn2eKML+VKqBfErMfuvthfAExmVVI
=k0Bc
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
