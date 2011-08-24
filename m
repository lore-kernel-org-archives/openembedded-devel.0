Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QwKNr-00037u-Gh
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 22:49:11 +0200
Received: (qmail 2600 invoked by uid 1003); 24 Aug 2011 20:44:24 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Aug 2011 20:44:24 -0000
Message-ID: <4E5562A6.1080705@balister.org>
Date: Wed, 24 Aug 2011 13:44:22 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E554AD9.90607@balister.org>
	<20110824194923.GC4258@rhein.zuhause.netz>
In-Reply-To: <20110824194923.GC4258@rhein.zuhause.netz>
Subject: Re: Build failure for openjade in dev
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
X-List-Received-Date: Wed, 24 Aug 2011 20:49:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2011 12:49 PM, Henning Heinold wrote:
> On Wed, Aug 24, 2011 at 12:02:49PM -0700, Philip Balister wrote:
>> I am seeing this building openjade. As near as I can see, there
>> haven't been any changes to cause this. It does build in
>> release-2011.3-maintenance.
>>
>> Anyone have any clues?
>>
>> Philip
>> | + install-catalog --add /home/balister/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat /home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/catalog
>> | install-catalog: unable to write in /etc/sgml.
>
> hm maybee you need to traint install-catalog not to write at /etc/sgml

The weird bit it this worked recently, and does work in the release branch.

Philip


