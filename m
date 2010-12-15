Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PSql0-0000dl-0P
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 13:47:00 +0100
Received: (qmail 17423 invoked by uid 1003); 15 Dec 2010 12:45:15 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Dec 2010 12:45:15 -0000
Message-ID: <4D08B85B.3000404@balister.org>
Date: Wed, 15 Dec 2010 07:45:15 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PR45K-0000jK-SU@melo.openembedded.org>	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>	<4D077186.2050708@balister.org>
	<20101214133729.GE6662@jama>	<ie9tg4$9t0$1@dough.gmane.org>
	<20101215082910.GA3238@jama>
In-Reply-To: <20101215082910.GA3238@jama>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Wed, 15 Dec 2010 12:47:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2010 03:29 AM, Martin Jansa wrote:
> On Wed, Dec 15, 2010 at 09:16:04AM +0100, Koen Kooi wrote:
>> What are other distributions based on? Pixie dust?
>
> I meant distritubions where end-user normally gets only recipes how to build from source
> on his machine instead of installing prebuilt binary packages shipped by distribution.
>
I am not sure there is a lot od software that uses the problematic header :)

Khem suggested we put the file in include/i2c-tools/i2c-dev.h. This 
means programs that need the i2c-tools version can adjust the header 
search path with a -I.

Philip


