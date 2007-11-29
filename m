Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1IxhdS-0006v6-Sj
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 12:32:50 +0100
Received: from openmoko ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 29 Nov 2007 11:29:48 +0000
	id 0006822F.474EA2AC.00002E02
Date: Thu, 29 Nov 2007 11:29:47 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071129112947.1fd36922@openmoko>
In-Reply-To: <474D5541.2020107@xora.org.uk>
References: <474D5541.2020107@xora.org.uk>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC] Fix uImage generation in way compatible with kernel.bbclass
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
X-List-Received-Date: Thu, 29 Nov 2007 11:32:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Nov 2007 11:47:13 +0000
Graeme Gregory <dp@xora.org.uk> wrote:

> I would like to do the attached patch to linux.inc to change uImage
> generation so it is compatible with the way kernel.bbclass does
> things.
> 
> This means the uImage ends up in kernel-image not some random file
> called uImage but not really a uImage.
> 
> koen said the do_install_prepend stuff was to work around vendor bugs
> and is no longer needed in this file.
> 
I think we have knocked down all the objections by email now?

Shall I apply?

Graeme


