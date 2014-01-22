Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 235FD6B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:28:03 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wo20so466683obc.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=JmYltrqdf6sav616eNAoVOvThuBWP93Au7lslo6T6oY=;
	b=WBICH2npyIG/Uu52q9YLIIHBNATTIDbub631AKfxxR/14lyWWwonLnCVruY55c8Ykc
	acoAOVVu1cQvB4jSupASUuiHQG206kA/wV47xTAUNQP3HhGL9zJdACiUqUH8uEGFAiCe
	+hGhDOt3+jbM21Fkh9cX4jhx2djv0epOn2EZYMfEr7PwpbeOH1sRHKfCb0Z19sM+gkjL
	mRLMYZpWxncxuxuE4UWBjntThF3HqMjU3m1Xs9xgG2tDslsXgPBTnuEkEbPzDqE4au5E
	q4+EB57RiJjNOCSOwPvJucQCBw9PWDf6q9bEJh6u8Hq1RjH26nkHgeLwl/DFL7S4UpLg
	/vAQ==
MIME-Version: 1.0
X-Received: by 10.60.37.99 with SMTP id x3mr1435305oej.61.1390400883997; Wed,
	22 Jan 2014 06:28:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:28:03 -0800 (PST)
In-Reply-To: <1390239757-27055-3-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
	<1390239757-27055-3-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 22 Jan 2014 12:28:03 -0200
X-Google-Sender-Auth: -_flLDSwCIziStIuidD7-N3lhAc
Message-ID: <CAP9ODKpFx0Gp3XqG8kGEB2TP95MXnfp7wrKWgGrnVYrrAx2_GA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] python-efl: Upgrade to 1.8.1 and update packaging to match old packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 14:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 3:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * announcement:
>   http://sourceforge.net/mailarchive/message.php?msg_id=31862842
> * like in efl recipe create packages matching with old separate recipes
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

I'd prefer this in two patches (one reworking the packaging and
another for the update) but I think it is fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

