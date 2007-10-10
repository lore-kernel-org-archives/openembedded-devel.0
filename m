Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1Ife5q-0001xG-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2007 18:07:30 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.2.131]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Ife09-0007wV-48
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2007 18:01:37 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20071010170248.3c79ea88@aquilonia>
References: <8200BBD0-C467-4FF2-9F31-5718061769FB@selfish.org>
	<20071010170248.3c79ea88@aquilonia>
Message-Id: <C299465F-E938-410F-939E-5B808A6E49FA@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Wed, 10 Oct 2007 18:01:27 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: OpenEmbedded read-only GIT mirror
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
X-List-Received-Date: Wed, 10 Oct 2007 16:07:31 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 10.10.2007 um 17:02 schrieb Graeme Gregory:

> On Wed, 10 Oct 2007 15:57:39 +0200
> Holger Freyther <zecke@selfish.org> wrote:
>
>> This has happened for git and I'm proud to announce a git-mirror of
>> OpenEmbedded which is located at http://repo.or.cz/w/
>> org.openembedded.dev.git. I try to keep this updated and automate it
>> as well. The other branches of OpenEmbedded will follow as well.
>>
> It doesnt rally work.
>
> git-clone http://repo.or.cz/r/org.openembedded.dev.git oe
>
> ..... more stuff than fits on my console
> walk dae25734c9ab10815ae9af44852e0a972303924a
> walk 4cb94b77393071d7329d516a0b1994efc67d4eee
> walk 97388732bdceecb0a645f79e1e6aa3ae24957a42
> walk 4560b74d94658ac6d4ba426e439f9cb7d42f43ea
> walk a48715e801afcf945d84e58635c00cee842ea2c5
> walk 675cb622001c0921c087df22181bd91457b868b2
> walk e7e52bec687de97e344f2d4f6609bacbb3d1e51f
> walk f4603f6e4561ac749d54cb90afef6f2be55f39f6
> cat: /home/dp/repos/oe/.git/refs/remotes/origin/master: No such  
> file or
> directory fatal: Not a valid object name HEAD

Hi,

why do you need a master? I created one though... and thanks for  
informing.

z.

PS: To make me remember git-push git+ssh://repo.or.cz/srv/git/ 
org.openembedded.dev.git org.openembedded.dev:master is the command  
to use....


