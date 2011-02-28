Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu8AU-0004aX-Gl
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:50:02 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pu896-0004U6-Ks from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 10:48:36 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 10:48:36 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 10:48:35 -0800
Message-ID: <4D6BEDF2.20006@mentor.com>
Date: Mon, 28 Feb 2011 11:48:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D6BBFDE.2090406@mentor.com>
	<20110228170111.GB4192@excalibur.local>
In-Reply-To: <20110228170111.GB4192@excalibur.local>
X-OriginalArrivalTime: 28 Feb 2011 18:48:36.0484 (UTC)
	FILETIME=[1B55B440:01CBD778]
Subject: Re: Release-2011.03 status
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
X-List-Received-Date: Mon, 28 Feb 2011 18:50:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2011 10:01 AM, Stefan Schmidt wrote:
> Hello.
>
> On Mon, 2011-02-28 at 08:31, Tom Rini wrote:
>>
>> So, my current plan of attack is to do what I've said before and
>> merge the libvpx work-around, tag, revert the libvpx work-around
>> (per Khem's request).  And I plan to do this tomorrow unless people
>> shout about wanting to fix something they know is broken and need a
>> little more time.
>
> For llvm and thus openjdk-6 we need the patch merged I posted today. I'm not
> completely sure that it is the best solutions thats why I posted it instead of
> just commit it.

Hmm, can you show the failure log?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


