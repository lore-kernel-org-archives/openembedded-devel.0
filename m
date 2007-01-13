Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <patrick_fischer@gmx.de>) id 1H5qJT-0007iV-GF
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jan 2007 22:21:19 +0100
Received: (qmail invoked by alias); 13 Jan 2007 21:19:09 -0000
Received: from i577A10FF.versanet.de (EHLO [192.168.1.9]) [87.122.16.255]
	by mail.gmx.net (mp052) with SMTP; 13 Jan 2007 22:19:09 +0100
X-Authenticated: #1735141
Message-ID: <45A94CCC.5060605@gmx.de>
Date: Sat, 13 Jan 2007 22:19:08 +0100
From: Patrick Fischer <patrick_fischer@gmx.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.0.7) Gecko/20060918 Thunderbird/1.5.0.7 Mnenhy/0.7.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
X-Mailman-Approved-At: Tue, 16 Jan 2007 09:30:58 +0100
Subject: testing with qemu
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
X-List-Received-Date: Sat, 13 Jan 2007 21:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello
I have a question about testing my own disti with qemu.

This is a good description by it dosn't work for me. I have a x86 based 
system.
http://www.rpsys.net/openzaurus/qemu/

I have created my own x86 based disti with
bitbake task-bootstrap
bitbake bootstrap-image

My machine is
MACHINE = "qemux86"

I have created
bzImage-2.6.18-qemux86-20070112211142.bin
and
modules-2.6.18-qemux86.tgz

how can i test the image with qemu?

Is there an other way to test my image without qemu?
maybe with vmware?


Best regards
Patrick Fischer


