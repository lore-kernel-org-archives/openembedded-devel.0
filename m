Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp12r-0003y8-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 17:13:01 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pp11j-00070j-Ag from Tom_Rini@mentor.com ;
	Mon, 14 Feb 2011 08:11:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 08:11:50 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 09:11:50 -0700
Message-ID: <4D59543B.50506@mentor.com>
Date: Mon, 14 Feb 2011 09:11:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>	<20110208145355.GF2050@xora-build.xora.org.uk>	<4D515A17.3060203@mentor.com>
	<4D523623.7030509@opensimpad.org>
In-Reply-To: <4D523623.7030509@opensimpad.org>
X-OriginalArrivalTime: 14 Feb 2011 16:11:50.0301 (UTC)
	FILETIME=[E30794D0:01CBCC61]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Mon, 14 Feb 2011 16:13:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
> On 08.02.2011 15:58, Tom Rini wrote:
>> On 02/08/2011 07:53 AM, Graeme Gregory wrote:
>>> On Tue, Feb 08, 2011 at 07:42:51AM -0700, Tom Rini wrote:
>>>> angstrom-2008.1 / angstrom-2010.x:
>>>> hawkboard, mini2440, mini6410, beagleboard + console-image /
>>>> qt4-x11-demo-image / qt4e-demo-image
>>>>
>>> atngw100 should be added to angstrom 2008.1/2010.x this makes
>>> us a little less arm centric :-)
>>>
>>> atngw100 is uclibc so I only expect console-image to build without
>>> error.
>>
>> Done.
>>
>
> I have access to such a device and can test booting of console-image

Fails to build with: http://pastebin.com/rjsmt0M9

-- 
Tom Rini
Mentor Graphics Corporation


