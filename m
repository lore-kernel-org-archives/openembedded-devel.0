Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H3wzk-0005iW-Q2
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 17:05:08 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5835824ugf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 08:03:29 -0800 (PST)
Received: by 10.78.47.15 with SMTP id u15mr4063315huu.1168272209355;
	Mon, 08 Jan 2007 08:03:29 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Mon, 8 Jan 2007 08:03:28 -0800 (PST)
Message-ID: <432beae0701080803u389b13d8o1eb6e8b0e921b684@mail.gmail.com>
Date: Mon, 8 Jan 2007 08:03:28 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200701081618.46665.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <200701081618.46665.openembedded@hrw.one.pl>
Subject: Re: Status of ARM machines in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jan 2007 16:05:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 1/8/07, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
>
> During weekend I build 'task-base' for all ARM (armv4t and better)
> machines and =C5ngstr=F6m distribution. The list included:
>
> a1200 a780 amsdelta compulab-pxa270 devkitidp-pxa255 ep93xx h1910 h1940
> h2200 h3900 h4000 h5000 h6300 htcblueangel htcuniversal hx2000 hx4700
> ks8695 logicpd-pxa270 magician mainstone mtx-3 mx21ads mx31ads
> navman-icn330 netbook-pro nokia770 omap1510inn omap1610h2 omap1710h3
> omap2420h4 omap5912osk palmld palmtx rokr-e2 rx3000 smdk2440 xxs1500
>
> This week ARM 'broken' machines are:
>
> a1200 - lack of kernel config - bug #1766
> omap1710h3 - lack of kernel config - bug #1736
> omap2420h4 - lack of kernel config - bug #1744
> xxs1500 - unfetchable kernel - bug #1737
>

What about the Zaurii?

--=20
Justin Patrin


