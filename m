Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OQdBS-0004sw-JB
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 11:20:56 +0200
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTB8t4XzgT3ULtu3Lzj+6g9NrVeAZ96e0@postini.com;
	Mon, 21 Jun 2010 02:16:18 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip07.e2k.ad.ge.com with ESMTP; 21 Jun 2010 04:29:48 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 21 Jun 2010 04:29:48 -0400
Message-ID: <4C1F22FA.6070200@ge.com>
Date: Mon, 21 Jun 2010 09:29:46 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D3F1A81-1C1A-4A1A-AD8C-C2EB865A7CAD@keylevel.com>	<AANLkTikzD0maKiGuE2bK5-I7dWpcm1W-UvC1uV9ei29H@mail.gmail.com>
	<3F67CA37-B0AD-45A5-9634-C1CF00E9A6AA@keylevel.com>
In-Reply-To: <3F67CA37-B0AD-45A5-9634-C1CF00E9A6AA@keylevel.com>
X-SA-Exim-Connect-IP: 64.18.0.180
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Network card not detected
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
X-List-Received-Date: Mon, 21 Jun 2010 09:21:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris Tapp wrote:
>> So you can add net-tools (and it's dependencies) to your
>> minimal-image, or to make life a little easier on yourself, use a more
>> complete image, something like console-image which should contain
>> everything you need to light up your Ethernet  port.
>
> Thanks - I've had a console-image build running for the past few hours
> - should soon be able to see what this does ;-)
>
>> Also, this discussion might be more appropriate on the
>> openembedded-users@ list.
>
> From looking at the
> http://wiki.openembedded.net/index.php/Mailing_lists wiki page I
> thought this list was no longer available as there's no 'subscribe'
> link. I'll have a go and see if I can register as I agree my questions
> are really 'user' related at this time.

That was indeed the plan:

http://lists.linuxtogo.org/pipermail/openembedded-users/2009-February/000969.html

Even before this, there were many people asking questions on
openembedded-users that either got bad, miss-leading or no answers
because of a lack of experienced / knowledgeable people on that list. I
don't think that the community around OE has grow/matured enough to make
resurrecting that list a good idea.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



