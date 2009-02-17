Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1LZW3m-00006T-O1
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 20:56:51 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id C374318058977
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2009 20:54:52 +0100 (CET)
Message-ID: <499B1606.3040406@opensimpad.org>
Date: Tue, 17 Feb 2009 20:54:46 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <499AD8D6.3000708@balister.org> <gnere3$16u$1@ger.gmane.org>
In-Reply-To: <gnere3$16u$1@ger.gmane.org>
Subject: Re: Autobuilder bugs versus stable branch being updated
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
X-List-Received-Date: Tue, 17 Feb 2009 19:56:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Philip,
>
> thank you for your comment.
>
> Philip Balister wrote:
>> I think it is a but of stretch to close old autobuilder bugs with the 
>> comment the stable branch will not be updated.
>
> That should not be the case (unless of course they were both of type 
> .stable and -autobuild).
>
We should create a new stable branch. The old one drifted too much away 
from .dev which makes it hard to backport things from .dev to stable.

Best regards
Bernhard Guillon


