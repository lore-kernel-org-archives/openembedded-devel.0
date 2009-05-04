Received: from [220.181.12.13] (helo=m12-13.163.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1M0vsz-0006Yx-4S
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 12:59:03 +0200
Received: from [192.168.58.100] (unknown [116.227.146.13])
	by smtp9 (Coremail) with SMTP id DcCowLBLCegZyf5Jgt7tEQ--.12324S2;
	Mon, 04 May 2009 18:53:15 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090503235917.GF7973@smtp.west.cox.net>
References: <1241357669.13222.0.camel@daniel-laptop>
	<20090503165548.GB7973@smtp.west.cox.net>
	<1241391783.13222.4.camel@daniel-laptop>
	<20090503231743.GC7973@smtp.west.cox.net>
	<1241394401.12036.11.camel@daniel-laptop>
	<20090503235917.GF7973@smtp.west.cox.net>
Organization: PALFocus (http://palfocus.oicp.net)
Date: Mon, 04 May 2009 18:53:09 +0800
Message-Id: <1241434389.4551.0.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DcCowLBLCegZyf5Jgt7tEQ--.12324S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUUYxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxYjxAI6xkYrwAYjxAI6xAIw28IcVW8ZrWlb7IF0VCF04k20xvE
	w2I207IF0wAYjxAI6xCIbckI1I0E57IF64kEYxAxM7k0a2IF6r1UM7kC6x804xWl14x267
	AKxVWUJVW8JwAFxVCF77xC6IxKo4kEV4yl1I0EscIYIxCEI4klw4CSwwAFIxvE14AKwVWU
	JVWUGwA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_GcCE3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4vEbcI7uVAqrcv_JFW8Xr15M2kK64x0aVW7GwIE548m6rI_Jw1UWr17M2kK64
	xIx7IE04vEw4CY0x0E548m6r1fGryUXwAa7VCY0VAaVVAqrcv_Jw1UWr13Mc804VCqF7xv
	r2I5Mc8Ir4CE8sxKj4xv1VCF748vxVAv7wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UM4x0Y48IcxkI7VAKI48JM4IE
	nf9ElVAFpTB2q-sK649IAas0WaI_GwCjxxvEw4Wlc7Ca8VAvwVCjb41lc2xSY4AK67AK6r
	4DMxkI7II2jI8vz4v_Jr0_Jryl42xK82IYc2Ij64vIr41l4x8a6c8ajcxJMI8E67AF67kF
	1VAFwI0_Jr0_JrylIxkGc2Ij64vIr4UvcSsGvfC2KfnxnUUI43ZEXa7IUYIdgJUUUUU==
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: Re: qemu-native build fail
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
X-List-Received-Date: Mon, 04 May 2009 10:59:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-03 at 16:59 -0700, Tom Rini wrote:
> If you're using the org.openembedded.dev branch, you need to do:
> bitbake -c clean qemu-native
> Then try again.  

Thanks Tom. It works :)
-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)




