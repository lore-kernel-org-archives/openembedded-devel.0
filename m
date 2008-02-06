Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JMnJc-0003Hi-U4
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2008 17:40:08 +0100
Received: by nf-out-0910.google.com with SMTP id h3so783143nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2008 08:40:16 -0800 (PST)
Received: by 10.78.160.2 with SMTP id i2mr18035086hue.53.1202316016118;
	Wed, 06 Feb 2008 08:40:16 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.196])
	by mx.google.com with ESMTPS id c22sm7572458ika.3.2008.02.06.08.40.14
	(version=SSLv3 cipher=OTHER); Wed, 06 Feb 2008 08:40:15 -0800 (PST)
Date: Wed, 6 Feb 2008 18:40:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080206184015.40bf51c1@widy.localdomain>
In-Reply-To: <1201565225.4687.98.camel@localhost.localdomain>
References: <20080129014117.60ed9f77@widy.localdomain>
	<1201565225.4687.98.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: [ann] Utils for converting rootfs images to other formats
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
X-List-Received-Date: Wed, 06 Feb 2008 16:40:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

[]

> > Oh, and btw, I have a bunch of standalone filesystem conversion
> > scripts which I can't find time to RFC for addition to contrib/.
> > While OE has ability to generate images in different formats,
> > sometimes there's a need/easier to convert one existing flexible
> > format. 
> 
> I'd say feel free to add them...

Added as contrib/image-convert/ . Of course, they mostly include
ability to convert generic archive formats (cpio/tar) to something ;-).

> 
> Regards,
> 
> Richard
> 
> 


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


