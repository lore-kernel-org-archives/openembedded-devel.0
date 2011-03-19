Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q14rJ-0005eh-6R
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 23:42:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q14pZ-0002oi-3o from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 15:41:09 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 19 Mar 2011 15:41:08 -0700
Received: from [172.30.80.15] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sat, 19 Mar 2011 15:41:08 -0700
Message-ID: <4D8530EF.5040307@mentor.com>
Date: Sat, 19 Mar 2011 15:40:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
	<4D83E632.2040701@xora.org.uk>
In-Reply-To: <4D83E632.2040701@xora.org.uk>
X-OriginalArrivalTime: 19 Mar 2011 22:41:08.0944 (UTC)
	FILETIME=[BD7F6500:01CBE686]
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Sat, 19 Mar 2011 22:42:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2011 04:09 PM, Graeme Gregory wrote:
> On 18/03/2011 19:24, Dr. Michael Lauer wrote:
>> Salut,
>>
>> the blacklisting of packages as found in angstrom.bbclass
>> is pretty helpful and would be beneficial to all kinds
>> of distribution configurations in OE. Would there be
>> a strong objection of renaming this to blacklist.bbclass?
>>
>> Copying, of course, is also a possibility, but
>> in my opinion it would only be the second best choice.
>>
> As the author I object to renaming it.
>
> We have played this rename game before and Im still not happy with the
> results of the last time.
>
> I also object on the grounds of the amount of abuse I got from some
> other distro maintainers for implementing this, which is the reason it
> is called angstrom.bbclass.

OK.  Can we change the message so it says ${DISTRO} doesn't support, 
rather than Angstrom doesn't support?

-- 
Tom Rini
Mentor Graphics Corporation


