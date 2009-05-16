Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M5R5g-0004cT-2p
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 23:06:44 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M5Qya-0006we-IE
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 21:59:26 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Sat, 16 May 2009 21:59:07 +0100
Message-Id: <1242507547.4226.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] xserver-kdrive-common: fixed xTs_Calibrate script	name.
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
X-List-Received-Date: Sat, 16 May 2009 21:06:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-16 at 23:16 +0300, Ihar Hrachyshka wrote:
>  sessionFiles = "\
> -  30xTs_Calibrate \
>    60xXDefaults \
>    90xXWindowManager \
> +  98xTs_Calibrate \
>    "

What's the reason for this?  Your email was a bit short on explanation
but it seems a little strange to be starting the window manager and
suchlike before calibration runs.

p.




