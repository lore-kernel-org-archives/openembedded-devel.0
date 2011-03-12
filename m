Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PyN6G-0003pD-5J
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 12:35:13 +0100
Received: (qmail 3767 invoked by uid 1003); 12 Mar 2011 11:33:32 -0000
Received: from unknown (HELO ?192.168.5.198?)
	(philip@opensdr.com@64.134.152.41)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Mar 2011 11:33:32 -0000
Message-ID: <4D7B5A0B.3040806@balister.org>
Date: Sat, 12 Mar 2011 04:33:31 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ileat6$gdk$2@dough.gmane.org>
	<1299887126-24886-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1299887126-24886-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] angstrom-20101: prefer qt 4.7.2
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
X-List-Received-Date: Sat, 12 Mar 2011 11:35:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Acked-by: Philip Balister <philip@balister.org>

On 03/11/2011 04:45 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 7a19f2d..2ec92ec 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -1,5 +1,5 @@
>   ANGSTROM_MESA_VERSION = "7.9.1"
> -ANGSTROM_QT_VERSION ?= "4.7.1"
> +ANGSTROM_QT_VERSION ?= "4.7.2"
>   ANGSTROM_LIBTOOL_VERSION = "2.4"
>   # Use new sysroot feature
>   LIBTOOL_HAS_SYSROOT = "yes"


