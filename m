Received: from [203.8.2.122] (helo=mail.einfosolutions.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Richard.How@einfosolutions.com>) id 1Gmgc3-00088q-F1
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 02:09:22 +0100
Received: from Ubiquitous.localnet ([203.8.2.80] RDNS failed) by
	mail.einfosolutions.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 22 Nov 2006 11:41:37 +1030
Date: Wed, 22 Nov 2006 11:35:57 +1030
From: Richard How <Richard.How@einfosolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20061122113557.a185b49d.Richard.How@einfosolutions.com>
In-Reply-To: <4562E9A8.4090400@kernelconcepts.de>
References: <45619EA0.2090801@kernelconcepts.de>
	<20061121121036.51999b8a.Richard.How@einfosolutions.com>
	<4562E9A8.4090400@kernelconcepts.de>
X-Mailer: Sylpheed version 2.2.10 (GTK+ 2.6.10; i686-pc-linux-gnu)
Mime-Version: 1.0
X-OriginalArrivalTime: 22 Nov 2006 01:11:37.0265 (UTC)
	FILETIME=[28889A10:01C70DD3]
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: MIPS32 big endian support?
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
X-List-Received-Date: Wed, 22 Nov 2006 01:09:23 -0000
Content-Type: multipart/mixed;
	boundary="Multipart=_Wed__22_Nov_2006_11_35_57_+1030_pxT/8YAAPaguGYeJ"

--Multipart=_Wed__22_Nov_2006_11_35_57_+1030_pxT/8YAAPaguGYeJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Nov 2006 12:57:28 +0100
Nils Faerber <nils.faerber@kernelconcepts.de> wrote:
> Cool!
> Which distribution and machine config did you use? I did not find any
> big endian configs in standard OpenEmbedded...
> Did you use uclibc? Gcc compile failed with uclibc and I had to add two
> minor patches...

Hi Nils,
I created my own machine and distro conf files which I have attached.
My first attempt to use OE properly, lots of guessing and trial and error :)
We are a small company in Australia and hope to launch our product in a
couple of weeks. At that stage we hope to engage more with the open
source community to make sure credit is given to all the people who
contribute to OE and GPE and let them see what can be done with it.

Cheers

Richard How


--Multipart=_Wed__22_Nov_2006_11_35_57_+1030_pxT/8YAAPaguGYeJ--
