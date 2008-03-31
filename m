Received: from [64.233.178.242] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JgO6d-0000x3-1G
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 19:47:39 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1988809hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 10:47:33 -0700 (PDT)
Received: by 10.100.229.12 with SMTP id b12mr16582734anh.60.1206985653348;
	Mon, 31 Mar 2008 10:47:33 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 31 Mar 2008 10:47:33 -0700 (PDT)
Message-ID: <c384c5ea0803311047g1665c14fqfe6fc2417abfb969@mail.gmail.com>
Date: Mon, 31 Mar 2008 19:47:33 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803311134.26764.geoffrey@pager.net>
MIME-Version: 1.0
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
	<fsr2gk$t6o$1@ger.gmane.org> <200803311134.26764.geoffrey@pager.net>
Subject: Re: New OE user question
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
X-List-Received-Date: Mon, 31 Mar 2008 17:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, Mar 31, 2008 at 6:34 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> On Monday 31 March 2008 11:12:03 am Koen Kooi wrote:
>
> > Leon Woestenberg schreef:
> > | Can someone suggest a saner distribution for this Samsung chip?
>  > It's an atmel chip, and atmel itself recommends angstrom:
>  > http://www.linux4sam.org/twiki/bin/view/Linux4SAM/OpenEmbeddedAngstrom
>
Whoops on the chip, and yes they do recommend Angstrom when choosing
OpenEmbedded.

Now it seems so far Atmel seems to use buildroot a lot as well.

>  recommend against OE / Angstrom.  Interesting side note, it seems they
>  recently had to rollback some of their AVR32 gcc patches in the buildroot
>  mainline because they were breaking stuff there.
>
I saw that. I wonder if "there" means uclibc (in case we are affected
as well), or buildroot specifics (where they break other archs)?

Regards,
-- 
Leon


