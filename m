Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M7yCX-0004Qm-J2
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 22:52:18 +0200
Received: (qmail 5670 invoked from network); 23 May 2009 20:44:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 23 May 2009 13:44:26 -0700
Date: Sat, 23 May 2009 13:44:24 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523204424.GJ23842@smtp.west.cox.net>
References: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] checksums.ini: add checksums for netsurf-2.1 and	related libs
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
X-List-Received-Date: Sat, 23 May 2009 20:52:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 12:35:15AM +0400, Dmitry Artamonow wrote:
> Full list:
>  * netsurf-2.1
>  * hubbub-0.0.1
>  * libparserutils-0.0.1
>  * libnsbmp-0.0.1
>  * libnsgif-0.0.1
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  conf/checksums.ini |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 964f728..32601b3 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -10574,6 +10574,10 @@ sha256=bedfd45364948a08ecaa212c5eda6667a83ac8bb547e2eb8478ade885898cad7
>  md5=f720686c841e9fefc06db76458fd9908
>  sha256=1f8259a3a8ae583170816f5028329f3a7157f87f927da9c0a911a5fb9be263a1
>  
> +[http://www.netsurf-browser.org/projects/releases/hubbub-0.0.1-src.tar.gz]
> +md5=58c6e2b5a5906f3f0bf136c0c71b5403
> +sha256=3ba0bdf71376429bb3ce8ae51595fc25e6a5147cdcc26e47b6da17386eb78cdf
> +
>  [http://cvs.haskell.org/Hugs/downloads/Nov2003/hugs98-Nov2003.tar.gz]
>  md5=e80a6739ead9a260087fe4d3fc6a8359
>  sha256=9f90613de73e1b8e90d9bbcb09046e83680f15a46fc630c3e26e9aa4ca0e6a1d
> @@ -13806,6 +13810,14 @@ sha256=15b0492ac252f6e8ce57c106bda0722413196d16d198c97f20a05908d1b977af
>  md5=ba76f68b7e3bd284ac2c2a1b9c5ecb06
>  sha256=2389a9b8220f776033f728a8d46352cfee5c8705066e34887bfb188f9f0d3856
>  
> +[http://www.netsurf-browser.org/projects/releases/libnsbmp-0.0.1-src.tar.gz]
> +md5=61e1e5703580c1bc7d950a1aacea7bad
> +sha256=424d12aae7a6ea8c90438cf4ccff486dc01a3a2a7b68eb602ee2b8c28178b6d1
> +
> +[http://www.netsurf-browser.org/projects/releases/libnsgif-0.0.1-src.tar.gz]
> +md5=a547da766fccacd00fd05190baf644da
> +sha256=54f316f530caaacd55dc23f546537759382a45ac6378ead249b5a5d51cf4db52
> +
>  [http://www2.autistici.org/bakunin/libnxml/libnxml-0.16.tar.gz]
>  md5=85b6a42a9e17a23c01b2f2ed0ece0563
>  sha256=6154872089834b0ffd34e92612d07e2d1ccec572698bd861da752eeeaab7ca78
> @@ -14018,6 +14030,10 @@ sha256=7a61e8b686ae7d659835175018da3a1baa959329b77c18e6e9381a197937296f
>  md5=7075f580606a84e63b7d6d9fa3124c31
>  sha256=7ff5f355bb254a3d4ed4541377e6304432ee8678e7c9ec29e7d43488903004c9
>  
> +[http://www.netsurf-browser.org/projects/releases/libparserutils-0.0.1-src.tar.gz]
> +md5=5999c2d52f8c07eeef2a8808fee4f858
> +sha256=5aed4edfd2023ed3ccd566fe76131d10faf43c8c3efa2e90978eed37c5503165
> +
>  [http://www.at.tcpdump.org/release/libpcap-0.9.3.tar.gz]
>  md5=0ad921c881fdd3d278046afcd352a151
>  sha256=f20d19b1f32e4ee465169ff1e17a3755bfda8c697cfed11fe36cbf6959c80441
> @@ -17258,6 +17274,10 @@ sha256=844ba97e745a0b9f37afc7daa323cafcef00108cd0254667da0a00558eb323a7
>  md5=36f7b3120e00c9c74cb6619334de419f
>  sha256=6eed89b661ae9f2ac0d383414ca964abea8a115f8fba0f7ab37b49b565ffb2a8
>  
> +[http://www.netsurf-browser.org/downloads/releases/netsurf-2.1-src.tar.gz]
> +md5=f0a34fd076b492c1a13b45432e8d7e49
> +sha256=cda2cf41c852938c226c47c2b995d527387120141f68b416ea745e50a7165a81
> +
>  [http://ftp.gnome.org/pub/GNOME/sources/network-manager-applet/0.6/network-manager-applet-0.6.5.tar.bz2]
>  md5=1c94a41e2399d261985a75f0cd3b895b
>  sha256=9cca3e34e23f00c82bc5e7237aa81639874e90d43a689e26fbfd938279ca31c9
> -- 
> 1.6.0.6
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


