Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIKRu-00057H-87
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 12:38:58 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLL008WO3QOAO50@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	21 Jun 2009 03:28:05 -0700 (PDT)
Message-id: <6853E166-9FC6-4721-A0FD-9E6879084C65@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245578752.29153.330.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 14:27:44 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
	<DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
	<F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
	<F69BF2F7-2158-4DA3-80D9-A2530B4BFB9A@mac.com>
	<08E9BB6D-02FB-4AE3-9E5E-0330A4FC4FF5@mac.com>
	<1245578752.29153.330.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Writing a test program for libserial
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
X-List-Received-Date: Sun, 21 Jun 2009 10:38:58 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,

On Jun 21, 2009, at 2:05 PM, Phil Blundell wrote:

>> inherit autotools_stage
>> AUTOTOOLS_STAGE_PKGCONFIG = 1
>>
>> do_stage() {
>> 	autotools_stage_all
>> }
>
> These lines are unnecessary: your recipe doesn't have anything to  
> stage
> and, even if it did, it isn't using autotools so these lines wouldn't
> help.  You might as well delete them.

I've got it now.

Thanks for the guidance !

Elvis

