Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KzuFK-0000Q7-Mz
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 15:29:34 +0100
Received: from [192.168.1.10] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 11 Nov 2008 14:27:39 +0000
	id 00034E64.4919965B.00001C35
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226337300.6989.2.camel@aquilonia>
References: <1226054458.7175.3.camel@aquilonia>
	<87mygarid7.fsf@neumann.lab.ossystems.com.br>
	<1226256825.6785.0.camel@aquilonia>
	<87wsfbhkel.fsf@neumann.lab.ossystems.com.br>
	<1226337300.6989.2.camel@aquilonia>
Date: Tue, 11 Nov 2008 14:27:38 +0000
Message-Id: <1226413658.6978.2.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
Subject: Re: Xorg X11R7.4 updates
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
X-List-Received-Date: Tue, 11 Nov 2008 14:29:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

On Mon, 2008-11-10 at 17:15 +0000, Graeme Gregory wrote:
> Ok, just to prove this acutally runs and using tslib driver for
> touchscreen here is a scap picture of x11-image running using Xorg
> X11R7.4 (server version 1.5.1)
> 
> http://scap.linuxtogo.org/files/e4d83971b3de72c0953046cdc508fd44.png
> 
> Graeme
> 

And another update, with some help from koen I managed to beat
xf86-input-tslib up a little so it no longer needs hard coded
resolutions.

http://scap.linuxtogo.org/files/ddb1bbb5ccc99bc8d3d3e36dba2673d9.png

Is Xorg running on a freerunner without an xorg.conf

Graeme




