Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pnzm9-00021E-86
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 21:39:33 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pnzl4-0002fp-IR from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 12:38:26 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 12:38:25 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 13:38:25 -0700
Message-ID: <4D559E3A.9070000@mentor.com>
Date: Fri, 11 Feb 2011 13:38:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297455456-21706-1-git-send-email-gdalex@gmail.com>
In-Reply-To: <1297455456-21706-1-git-send-email-gdalex@gmail.com>
X-OriginalArrivalTime: 11 Feb 2011 20:38:25.0598 (UTC)
	FILETIME=[A1BAF5E0:01CBCA2B]
Subject: Re: [PATCH] libtomcrypt: updated download link
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
X-List-Received-Date: Fri, 11 Feb 2011 20:39:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2011 01:17 PM, George Alexandru Dorobantu wrote:
> * updated the download link; libtomcrypt has moved to google code and the old link is dead
>
> Signed-off-by: George Alexandru Dorobantu<gdalex@gmail.com>
> ---
>   recipes/libtomcrypt/libtomcrypt_1.17.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libtomcrypt/libtomcrypt_1.17.bb b/recipes/libtomcrypt/libtomcrypt_1.17.bb
> index 9fc9fd0..2f82e36 100644
> --- a/recipes/libtomcrypt/libtomcrypt_1.17.bb
> +++ b/recipes/libtomcrypt/libtomcrypt_1.17.bb
> @@ -9,7 +9,7 @@ PRIORITY = "optional"
>   LICENSE = "PD"
>   PR = "r0"
>
> -SRC_URI = "http://libtom.org/files/crypt-${PV}.tar.bz2"
> +SRC_URI = "http://libtomcrypt.googlecode.com/files/crypt-${PV}.tar.bz2"
>
>   inherit autotools
>

Applied, thanks!

-- 
Tom Rini
Mentor Graphics Corporation


