Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCpaj-0003tM-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 09:45:56 +0200
Received: by fxm11 with SMTP id 11so2035479fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8IsPB2G3KgSmcYMoMQg7bU7l1vDaaJDPUxcEUELTiqY=;
	b=eCy6G1di7SViNkcbiqm1FKOZdKlkDyQYQ6QPMqYF2TwxJyG5ENzTmmYAI4We3afoEg
	5NdQi8k35PZazIp/Di5BaHkzVL9ClvFT9h2YMob+AJmq5hCPQ389G5Jr0F7gaLTtBsKk
	3N/GfGsGOA++0Owygd0Um0TMNK7hLo0/1qnGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Nq9IdCozK6rU7rjhVxjGO4fVzpQCOKcrOfQF44iDSM/mWppfiKRVTAKLx6w5AEbqzK
	k1qBSMk6eRd2pgg7tggFAz0bI9OUH4zfVYbPpnHd7kZZ4z0rE3EzDFObKRvw4GciASmZ
	Ype0lzTsLGKxQFfEqvcRkyi6hqSo5OC2uik1E=
Received: by 10.223.161.211 with SMTP id s19mr1103594fax.47.1273822912545;
	Fri, 14 May 2010 00:41:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm9691130far.18.2010.05.14.00.41.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 May 2010 00:41:51 -0700 (PDT)
Date: Fri, 14 May 2010 09:41:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100514074155.GP3370@jama>
References: <E1OChoj-0007ao-5h@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OChoj-0007ao-5h@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Khem Raj : eglibc: Bump SRCREV for 2.11 and trunk recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 May 2010 07:45:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 11:27:49PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 3b41668fc1e3db2713cfa61067146cfdaf2be37a
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=3b41668fc1e3db2713cfa61067146cfdaf2be37a
> 
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Thu May 13 16:27:10 2010 -0700
> 
> eglibc: Bump SRCREV for 2.11 and trunk recipes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> ---
> 
>  recipes/eglibc/eglibc_2.11.bb |    2 +-
>  recipes/eglibc/eglibc_svn.bb  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
> index 4f95cdc..988a9bc 100644
> --- a/recipes/eglibc/eglibc_2.11.bb
> +++ b/recipes/eglibc/eglibc_2.11.bb
> @@ -5,7 +5,7 @@ DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
>  PV = "2.11"
>  PR = "${INC_PR}.4"
> -SVN_REV="10440"
> +SVN_REV="10454"
>  EGLIBC_BRANCH="eglibc-2_11"
>  SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \

Hi,

we should probably bump PR in this case, because SVN_REV is not part of PV.

Or why not use s/SVN_REV/SRCREV/, drop ";rev=${SVN_REV}" from SRC_URI
and PR_append = "+svnr${SRCPV}"?

Thanks.


-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


