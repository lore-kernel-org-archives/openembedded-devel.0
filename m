Received: from 9.26.mail-out.ovh.net ([46.105.56.220] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLw3t-0004wb-SD
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:34:09 +0200
Received: (qmail 23501 invoked by uid 503); 16 May 2011 09:53:22 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 09:53:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 12:26:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 12:26:53 +0200
Message-ID: <4DD0FBEC.4020102@eukrea.com>
Date: Mon, 16 May 2011 12:26:52 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305541323-19773-1-git-send-email-sgh@sgh.dk>
In-Reply-To: <1305541323-19773-1-git-send-email-sgh@sgh.dk>
X-Ovh-Tracer-Id: 18153165673637195081
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] angstrom: Prefer Qt 4.7.3
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
X-List-Received-Date: Mon, 16 May 2011 11:34:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/05/2011 12:22, Søren Holm wrote:
> recipe for Qt 4.7.2 got delete, so prefer 4.7.3 instead.
>
> Signed-off-by: Søren Holm<sgh@sgh.dk>
> ---
>   .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 611c4e7..87da854 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -1,5 +1,5 @@
>   ANGSTROM_MESA_VERSION = "7.9.1"
> -ANGSTROM_QT_VERSION ?= "4.7.2"
> +ANGSTROM_QT_VERSION ?= "4.7.3"
>   ANGSTROM_LIBTOOL_VERSION = "2.4"
>   # Use new sysroot feature
>   LIBTOOL_HAS_SYSROOT = "yes"

oosp, I pushed prefence change for all distro and forget to push the one for 
Angstrom, that should be fixed now thanks !

Eric


