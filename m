Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8AAO-0007JE-9o for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 13:15:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8A9o-0007Iw-AG for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 13:15:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 13:15:04 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 13:15:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 19 Oct 2010 13:12:34 +0200
Message-ID: <i9juf2$ggu$2@dough.gmane.org>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
	<1287477207-27752-5-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287477207-27752-5-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/13] angstrom/build-feeds: remove openmoko targets
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
X-List-Received-Date: Tue, 19 Oct 2010 11:15:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-10-10 10:33, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  contrib/angstrom/build-feeds.sh |    4 ----

Acked-by: Koen Kooi <koen@openembedded.org>

>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/contrib/angstrom/build-feeds.sh b/contrib/angstrom/build-feeds.sh
> index e28d810..89df1ed 100755
> --- a/contrib/angstrom/build-feeds.sh
> +++ b/contrib/angstrom/build-feeds.sh
> @@ -269,7 +269,6 @@ do
>                        openbox \
>                        opencv \
>                        opencv-samples \
> -                      openmoko-browser2 \
>                        openredalert \
>                        openvpn \
>                        opie-notes \
> @@ -337,8 +336,6 @@ do
>                        systray \
>                        task-beagleboard-demo \
>                        task-gpe-pim \
> -                      task-openmoko-feed \
> -                      task-openmoko-games \
>                        task-opie-apps \
>                        task-opie-games \
>                        task-proper-tools \
> @@ -439,7 +436,6 @@ do
>              BUILD_CLEAN="qmake-native qmake2-native qt-x11-free python python-native python-pygtk gnome-icon-theme"
>          BUILD_TARGETS="task-base task-boot \
>                         task-opie task-opie-all \
> -                       task-openmoko-base task-openmoko-debug task-openmoko-examples task-openmoko-linux task-openmoko-native-sdk task-openmoko-net task-openmoko-phone task-openmoko-pim task-openmoko-ui \
>                         angstrom-x11-base-depends angstrom-gpe-task-settings \
>                         xserver-xorg-conf \ 
>                         "

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMvX0iMkyGM64RGpERAtPjAKCnl02auhnfCV4kRrYfWG/M+eHSZACdES4q
r+dC5BG8mmBKQTs7X+UmkXM=
=T2ua
-----END PGP SIGNATURE-----



