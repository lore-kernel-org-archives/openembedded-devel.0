Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M2QM8-0007op-Vr
	for openembedded-devel@openembedded.org; Fri, 08 May 2009 15:43:17 +0200
Received: (qmail invoked by alias); 08 May 2009 13:37:01 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp025) with SMTP; 08 May 2009 15:37:01 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX19OdVt8QMVOsUF/SkNSgvQPn0ERHx9bLyC9O8NGw0
	+XMyMllRyBPDAG
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@openembedded.org
Date: Fri, 8 May 2009 15:36:58 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200905081536.58988.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.75,0.75
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: micro image with ssh server
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
X-List-Received-Date: Fri, 08 May 2009 13:43:17 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I have created an image for the micro dist adding dropbear to the image.
When I try to connect with ssh, I have this error:
PTY allocation request failed on channel 0
shell request failed on channel 0

With the minimal distro it woks OK. Do I need to add some more software or is 
a problem of the micro distribution?


-- 
  - Eismann -

