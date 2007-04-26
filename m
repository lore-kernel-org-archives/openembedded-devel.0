Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1HhCW5-0005Xb-1s
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 00:32:45 +0200
Received: from cimmeria.hyboria ([::ffff:81.178.72.254])
	(AUTH: PLAIN dp, TLS: TLSv1/SSLv3,128bits,RC4-MD5)
	by xora.org.uk with esmtp; Thu, 26 Apr 2007 23:23:33 +0100
	id 0001C40C.46312665.000079DD
From: Graeme Gregory <dp@xora.org.uk>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0704261516y62dda543o62676432ac1bee76@mail.gmail.com>
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
	<432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
	<1177625217.4992.1.camel@cimmeria.hyboria>
	<432beae0704261516y62dda543o62676432ac1bee76@mail.gmail.com>
Date: Thu, 26 Apr 2007 23:23:52 +0100
Message-Id: <1177626232.4992.8.camel@cimmeria.hyboria>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the	build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 22:32:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

On Thu, 2007-04-26 at 15:16 -0700, Justin Patrin wrote:
> I was under the impression that /home was normally writable only by
> root and the subdirs were normally only writable by the user who owns
> the directory (yes, I know you can set them differently if you want).
> I know I wouldn't want joe-the-user creating directory /home/justinpa
> to try to confuse justinp whose home dir is /home/justinp.
> 
So someone makes an Angstrom based distro that is distributed on Ipaqs
to a school that person happens to be called John Smith (a very common
uk name). A kid at the school uses one in class and he happens to be
called John Smith and is kinda smart. Suddenly he is root.

Graeme




