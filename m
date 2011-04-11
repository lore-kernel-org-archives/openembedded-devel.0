Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q9Ndx-0005Pv-JG
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 22:23:33 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q9Nbo-0005HA-GT from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 13:21:16 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 11 Apr 2011 13:21:16 -0700
Received: from [172.30.80.119] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 11 Apr 2011 13:21:15 -0700
Message-ID: <4DA362BD.3020703@mentor.com>
Date: Mon, 11 Apr 2011 13:21:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <131E5DFBE7373E4C8D813795A6AA7F080340D39191@dlee06.ent.ti.com>	<20110411201207.GA30730@rhein.zuhause.netz>
	<131E5DFBE7373E4C8D813795A6AA7F080340D391AE@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080340D391AE@dlee06.ent.ti.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 Apr 2011 20:21:16.0346 (UTC)
	FILETIME=[029ED1A0:01CBF886]
Subject: Re: ncurses-5.7 patch files are missing
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
X-List-Received-Date: Mon, 11 Apr 2011 20:23:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/11/2011 01:17 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Henning Heinold
>> Sent: Monday, April 11, 2011 3:12 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] ncurses-5.7 patch files are missing
>>
>> On Mon, Apr 11, 2011 at 03:07:35PM -0500, Maupin, Chase wrote:
>>> All,
>>>
>>> Has anyone else noticed that the patch files referred to in the
>> ncurses_5.7 recipe are missing from the ftp site?  The patch files are:
>>>
>>> ncurses-5.7-20110108-patch.sh.bz2
>>> ncurses-5.7-20110115.patch.gz
>>>
>>> Does anyone have these mirrored or can they be uploaded to a mirror like
>> the Angstrom mirror?
>>>
>>>
>>> Sincerely,
>>> Chase Maupin
>>
>> Yes serval people reported that now, I have no acess to upload them. I
>> guess koen will do it when he returns
>> from elc.
> 
> Henning,
> 
> Thanks.  I didn't notice the reports on the mailing list.  I did however notice that Tom Rini is adding ncurses version 5.9 to oe-core.  I wonder if maybe this should be ported over to the OE mainline or just stick with 5.7+patches for now until everything is moved to oe-core.  Anyone else have thoughts on this?

It's already done (I got it in here first).

-- 
Tom Rini
Mentor Graphics Corporation


