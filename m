Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1H3INE-0007F1-Ej
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 21:42:40 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5554317ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jan 2007 12:41:11 -0800 (PST)
Received: by 10.78.185.16 with SMTP id i16mr3601161huf.1168116071493;
	Sat, 06 Jan 2007 12:41:11 -0800 (PST)
Received: by 10.78.164.17 with HTTP; Sat, 6 Jan 2007 12:41:11 -0800 (PST)
Message-ID: <f96d234e0701061241r4ab43c66y20a1c7a603b131f6@mail.gmail.com>
Date: Sat, 6 Jan 2007 15:41:11 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"Marcin Juszkiewicz" <openembedded@hrw.one.pl>
In-Reply-To: <f96d234e0612301433u641540f7ma1cf8438ecbae53c@mail.gmail.com>
MIME-Version: 1.0
References: <200612300001.09642.openembedded@hrw.one.pl>
	<f96d234e0612301433u641540f7ma1cf8438ecbae53c@mail.gmail.com>
Subject: Re: [REMOVAL] devkitidp-pxa255 machine
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
X-List-Received-Date: Sat, 06 Jan 2007 20:42:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/30/06, Cliff Brake <cliff.brake@gmail.com> wrote:
> On 12/29/06, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
>
> > One of serious problems is 'devkitidp-pxa255' machine. It use own kernel
> > patches and own patches to u-boot - both are unfetchable. If someone
> > maintain this MACHINE then please submit fixes/patches.
> >
> > I will add this machine into removal queue in January 2007 if no one will
> > bother with fixing it.
>
> Marcin,
>
> This is in my queue -- I'll try to get it fixed up in the next week.

u-boot and kernel are now buildable -- let me know if you run into any
other problems.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


