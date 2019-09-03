Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1150F7F301
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 03:26:37 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id a13so17942919qtj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 20:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OCt83uzJtG4E4ujFetusz8L8Zdggoh0+Aj0MXJtMSEQ=;
	b=O5cZ8THmMGf+hNay/VI6lKTxeWXrrAfras8D67xw9FFVMtt6xLs9hIms5E2DJxRlrt
	uT2OypwpqPB1BKSRC1E+Py0ssHvQus3nxBE4LMApfPjjtUsLs/KWEtYDvcwGnzIi+Kmt
	O4qdE9SR3x7lajKMLgnBbuBIaEz8+B/Jz3RtSm+AlueC9m/z+NUzp9IrS3vpmqDtqTH6
	SN4ernQYHLz0wDZTptYcRMeRaBlJ+Y95FLjO7sAmGbP7Dki/uIZskbPqSiipjrcbBwyw
	vKvmOpZtTz+FjPICmVwfWDcxL9+9yl4RQFAIYTEVy5EPXKPZCaIwuImcY3CUqzSpBoud
	ffrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OCt83uzJtG4E4ujFetusz8L8Zdggoh0+Aj0MXJtMSEQ=;
	b=ifwoFFyy0TsnROGWLhZUx0maW1xSYwWwqjMTWk32mWQevKr1SnjEtLhrwVIu9BGcv2
	r+sBB6H6xeaYxFfhkVXLhazBq9e8RKy3669BA5N5d//XqtmD51mg8oQ1KgP915vdYPfk
	gqTr4haGfInugjqMiq+2WSWuzGwEjQ7FokmBeYHEHeMN3/TlJ24MbIkZYGoBS5t3apd6
	2//LFcM53kPmJ0iD7+yTW+zwODqpYRWVZdVUqAbPGuYldnqW2EEHlxq0v24p6kpi/bku
	1lobY3zNsQGHr36TMaey2E1/vuuGdrdcFdUQYk2a7b1HaDvEBlagJ19vnW2QnHeg2vZP
	mSUA==
X-Gm-Message-State: APjAAAU6FghGQHi2wfHVrNzZNY2j8nQ9M1xOzIa0cCCh20QLedP7Gx5B
	w8pfNBADnJDS9h62WwARBzUndDinf3bDlhJzxYE=
X-Google-Smtp-Source: APXvYqyyyOKfQ8N4B1NCwvObCzz0qCXG9Nx0WKxMsUZRDg8WsHLlFEUWZUcudWCSETROX8fHOq2ozSsIkaE6/L9p6MM=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr23092547qtn.378.1567481198702;
	Mon, 02 Sep 2019 20:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <f8250bb8-db71-1946-45c5-94722c6c81f6@gmail.com>
In-Reply-To: <f8250bb8-db71-1946-45c5-94722c6c81f6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Sep 2019 20:26:12 -0700
Message-ID: <CAMKF1sozaDZaikAUQMqXBxtE3WDyu2JkBpkYf18wwYucyfwEOg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Merge request for thud
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
X-List-Received-Date: Tue, 03 Sep 2019 03:26:38 -0000
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Mon, Sep 2, 2019 at 8:02 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 9b3b907f30b0d5b92d58c7e68289184fda733d3e:
>
>   netkit-rsh: add tag to CVE patch (2019-05-27 22:22:25 -0700)
>
> are available in the git repository at:
>
>   https://git.openembedded.org/meta-openembedded
> aaa6eb0bb5da516373aa9e8c1dde8fdf85a54e95
>
> for you to fetch changes up to aaa6eb0bb5da516373aa9e8c1dde8fdf85a54e95:
>
>   lua: Security fix for CVE-2019-6706 (2019-09-02 19:54:39 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       lua: Security fix for CVE-2019-6706
>
> Peter Kjellerstedt (1):
>       apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS
>
> Qi.Chen@windriver.com (1):
>       apache2: set CVE_PRODUCT
>
> Yi Zhao (2):
>       apache2: upgrade 2.4.34 -> 2.4.39
>       apache2: upgrade 2.4.39 -> 2.4.41
>
>  .../recipes-devtools/lua/lua/CVE-2019-6706.patch   |  32 ++
>  meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |   1 +
>  .../recipes-httpd/apache2/apache2-native_2.4.34.bb |  46 --
>  ...nfigure-use-pkg-config-for-PCRE-detection.patch |   8 +-
>  ...-up-the-core-size-limit-if-CoreDumpDirec.patch} |  12 +-
>  ...ot-export-apr-apr-util-symbols-when-usin.patch} |  10 +-
>  ...ache2-log-the-SELinux-context-at-startup.patch} |  23 +-
>  ...replace-lynx-to-curl-in-apachectl-script.patch} |   6 +-
>  ...-the-race-issue-of-parallel-installation.patch} |   6 +-
>  ...apache2-allow-to-disable-selinux-support.patch} |   8 +-
>  ...-not-use-relative-path-for-gen_test_char.patch} |   8 +-
>  .../apache2/apache2/CVE-2018-11763.patch           | 512
> ---------------------
>  .../apache2/apache2/apache-configure_perlbin.patch |  27 --
>  .../{apache2_2.4.34.bb => apache2_2.4.41.bb}       | 202 ++++----
>  meta-webserver/recipes-httpd/apache2/files/init    |   0
>  15 files changed, 190 insertions(+), 711 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-corelimit.patch
> => 0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch} (83%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.4-export.patch
> => 0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch} (80%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-selinux.patch
> => 0004-apache2-log-the-SELinux-context-at-startup.patch} (85%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{replace-lynx-to-curl-in-apachectl-script.patch
> => 0005-replace-lynx-to-curl-in-apachectl-script.patch} (95%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.3-fix-race-issue-of-dir-install.patch
> => 0006-apache2-fix-the-race-issue-of-parallel-installation.patch} (94%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{configure-allow-to-disable-selinux-support.patch
> => 0007-apache2-allow-to-disable-selinux-support.patch} (91%)
>  rename
> meta-webserver/recipes-httpd/apache2/apache2/{server-makefile.patch =>
> 0008-apache2-do-not-use-relative-path-for-gen_test_char.patch} (76%)
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.34.bb =>
> apache2_2.4.41.bb} (61%)
>  mode change 100755 => 100644
> meta-webserver/recipes-httpd/apache2/files/init
>

