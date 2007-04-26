Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1HhCH8-0001T6-FM
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 00:17:18 +0200
Received: from cimmeria.hyboria ([::ffff:81.178.72.254])
	(AUTH: PLAIN dp, TLS: TLSv1/SSLv3,128bits,RC4-MD5)
	by xora.org.uk with esmtp; Thu, 26 Apr 2007 23:08:06 +0100
	id 0001C40C.463122C7.00007967
From: Graeme Gregory <dp@xora.org.uk>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
	<432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
Date: Thu, 26 Apr 2007 23:06:57 +0100
Message-Id: <1177625217.4992.1.camel@cimmeria.hyboria>
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
X-List-Received-Date: Thu, 26 Apr 2007 22:17:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


> A "huge gaping security hole" that requires you to download a
> malicious ipk with malicious libraries which figures out what your
> build path was, then installs those libraries there.
> 
> Or you could just download a malicious ipk which overwrites the actual
> libraries.
> 
> I don't see what's hude or gaping about this.
> 
Maybe you should rethink that before getting all sarcastic.

/home/XXX/ hmmm, thats publically writable to users.

And why do malicious libraries need to come in ipk files.

Graeme




