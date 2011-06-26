Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QalZq-0002tN-VT
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Jun 2011 11:24:27 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id E3F7715E0001; Sun, 26 Jun 2011 11:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-243-109.pools.arcor-ip.net
	[88.71.243.109]) by gravedo.de (Postfix) with ESMTPSA id E71F3799012
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jun 2011 11:20:46 +0200 (CEST)
Message-ID: <4E06F9ED.9080305@gravedo.de>
Date: Sun, 26 Jun 2011 11:20:45 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309004845.4286.11.camel@mattotaupa> <4E05DE80.4070507@gravedo.de>
	<1309015972.20483.6.camel@mattotaupa>
In-Reply-To: <1309015972.20483.6.camel@mattotaupa>
Subject: Re: [PATCH] aurora: Add `qt4-embedded` to `DEPENDS`
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
X-List-Received-Date: Sun, 26 Jun 2011 09:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.2011 17:32, Paul Menzel wrote:
> From: Paul Menzel<paulepanter@users.sourceforge.net>
> Date: Sat, 25 Jun 2011 16:47:02 +0200
>
> Task configure fails with the following error using `minimal` for `MACHINE = "beagleboard"`.
>
>          checking for FSOFRAMEWORK... yes
>            Qt base directory explicitly set to qtopia
>          checking for QT... no
>          configure: error: Package requirements (QtCoreE>= 4.7.0
>                  QtGuiE>= 4.7.0
>                  QtDeclarativeE>= 4.7.0) were not met:
>
>          No package 'QtCoreE' found
>          No package 'QtGuiE' found
>          No package 'QtDeclarativeE' found
>
> Adding `qt4-embedded` to `DEPENDS` fixes this error [1].
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-June/033590.html
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>

Acked-by: Simon Busch <morphis@gravedo.de>


