Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Kg018-0002AK-MF
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Sep 2008 18:36:39 +0200
Received: from aquilonia.hyboria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 17 Sep 2008 17:33:31 +0100
	id 00068384.48D1315B.00001EBC
Date: Wed, 17 Sep 2008 17:33:27 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080917173327.2d8c9da0@aquilonia.hyboria>
In-Reply-To: <f96d234e0809170925o139a0156h17f84a484bd3438b@mail.gmail.com>
References: <f96d234e0809161327v2d71e99bx79192593ff99086a@mail.gmail.com>
	<gap6bl$2ca$1@ger.gmane.org>
	<f96d234e0809161439tc0ed410jad0ae837edd24e29@mail.gmail.com>
	<gaql1h$b9$1@ger.gmane.org>
	<f96d234e0809170925o139a0156h17f84a484bd3438b@mail.gmail.com>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i486-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: xserver-kdrive 1.4 and USB keyboard
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
X-List-Received-Date: Wed, 17 Sep 2008 16:36:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Sep 2008 12:25:08 -0400
"Cliff Brake" <cliff.brake@gmail.com> wrote:
> Stuffing the 1.3 xmodmap settings into Xfbdev 1.4 does not seem to
> make any difference, so more digging ...
> 
Saving the xmodmap from 1.3 and loading it in 1.4 was exactly what I
did to "fix" the problem originally.

A nasty kludge, but after hours of git log checking I couldn't actually
find the keyboard change that caused the problem.

Graeme


