Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A59B2601F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 09:12:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9N9C5MG009343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 02:12:05 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 23 Oct 2014 02:12:04 -0700
Message-ID: <5448C66A.2020306@windriver.com>
Date: Thu, 23 Oct 2014 17:12:10 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1414055202-391-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1414055202-391-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-networking] Use texinfo-native instead of host command
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
X-List-Received-Date: Thu, 23 Oct 2014 09:12:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

sorry, Please drop it.

-R

On 10/23/2014 05:06 PM, rongqing.li@windriver.com wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   recipes-connectivity/inetutils/inetutils_1.9.2.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> index 2bae3ee..d909913 100644
> --- a/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> +++ b/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> @@ -3,7 +3,7 @@ networking utilities and servers including ftp, ftpd, rcp, \
>   rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>   talkd, telnet, telnetd, tftp, tftpd, and uucpd."
>   SECTION = "libs"
> -DEPENDS = "ncurses netbase readline"
> +DEPENDS = "ncurses netbase readline texinfo-native"
>   LICENSE = "GPLv3"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
>

-- 
Best Reagrds,
Roy | RongQing Li

