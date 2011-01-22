Received: from smtpauth20.prod.mesa1.secureserver.net ([64.202.165.36])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PgSLT-0000OT-Uy
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 02:32:52 +0100
Received: (qmail 12340 invoked from network); 22 Jan 2011 01:25:29 -0000
Received: from unknown (76.192.35.208)
	by smtpauth20.prod.mesa1.secureserver.net (64.202.165.36) with ESMTP;
	22 Jan 2011 01:25:29 -0000
Message-ID: <4D3A31FF.2010907@mwester.net>
Date: Fri, 21 Jan 2011 19:25:19 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>	<4D394AC0.90300@eukrea.com>
	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
In-Reply-To: <AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Sat, 22 Jan 2011 01:32:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/21/2011 10:33 AM, Khem Raj wrote:
> On Fri, Jan 21, 2011 at 12:58 AM, Eric Bénard <eric@eukrea.com> wrote:
>> Hi Khem,
>>
>> On 21/01/2011 09:29, Khem Raj wrote:
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>  recipes/busybox/busybox-1.18.2/slugos/usb.sh |   33
>>> ++++++++++++++++++++++++++
>>
>> Can't it become the generic script ? What makes it slugos specific ? (I
>> didn't make a diff vs the other one so the question may be stupid ;-)
>>
> 
> you should have diffed them. uevents are stored in different directory on slugos

Isn't this kernel-specific, though?  I don't have any other OE-based
devices handy just now to check, but what's difference, specifically,
and should we change something to bring SlugOS into line with the rest
of the world?

-Mike (mwester)


