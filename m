Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RV1RF-00019J-Fe
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 14:40:05 +0100
Received: (qmail 16976 invoked by uid 1003); 28 Nov 2011 13:33:22 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Nov 2011 13:33:22 -0000
Message-ID: <4ED38DA1.8060802@balister.org>
Date: Mon, 28 Nov 2011 08:33:21 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>	<1322476245.26081.89.camel@phil-desktop>	<1322478479.26287.15.camel@ted>
	<CAP9ODKqJdi_fNhBN7QZambbSRtE6w8z--EYRYoypT1Mm5AV6gw@mail.gmail.com>
In-Reply-To: <CAP9ODKqJdi_fNhBN7QZambbSRtE6w8z--EYRYoypT1Mm5AV6gw@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 13:40:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/28/2011 06:16 AM, Otavio Salvador wrote:
> On Mon, Nov 28, 2011 at 09:07, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
>> Rather than fork off the Yocto docs for OE's needs, it would be nice to
>> see if there was a way we could share the documentation.
>>
> 
> I fully agree with that.
> 
> The work would be much easier if all that could be shared.
> 
> AFAIK, using docbook it is possible to use macros to expand for branding
> and also conditional to output text so this could be done in a single
> repository.
> 

We need to be really careful how all the pieces get branded. There is
way too much confusion already, without referring people to the "Yocto
Instructions" to use OE-core + layers.

Philip


