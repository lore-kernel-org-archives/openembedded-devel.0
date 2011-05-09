Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QJO9L-0004pk-Rd
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 12:57:16 +0200
Received: (qmail 7681 invoked by uid 1003); 9 May 2011 10:54:29 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.165.110)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 May 2011 10:54:29 -0000
Message-ID: <4DC7C7E4.4020709@balister.org>
Date: Mon, 09 May 2011 06:54:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTimzgB9QSwwf2a=3n21-fUR=USwDUQ@mail.gmail.com>	<ipmian$2s9$1@dough.gmane.org>
	<4DBED1C2.4040006@mentor.com>	<1304856738.3355.94.camel@lenovo.internal.reciva.com>
	<8739ko9tld.fsf@eha.ulstruplund.dk>
In-Reply-To: <8739ko9tld.fsf@eha.ulstruplund.dk>
Subject: Re: Mirror at GitHub
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
X-List-Received-Date: Mon, 09 May 2011 10:57:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 04:16 AM, Esben Haabendal wrote:
> Phil Blundell<philb@gnu.org>  writes:
>
>> On Mon, 2011-05-02 at 08:46 -0700, Tom Rini wrote:
>>> Last I heard from Tom King this was still in progress / figuring out how
>>> to get it done.
>>
>> We now have a read-only mirror at github, see:
>>
>> https://github.com/openembedded
>>
>> Thanks to both the Toms for making this happen.
>>
>> Any problems with the mirror, please let me know.
>
> So is it preferred to place OE repositories on github.com in favor of
> gitorious.org?

There is no "official" preference. We just setup the mirror on github 
because people took the time to do so. If gitorious has the same feature 
we could set it up there also for people that prefer gitorious.

We should update the docs on the website to explain creating a personal 
github repo using the githib mirror feature, rather than jsut pushing 
the repo back.

Another idea is to pull from the github repo and push to the OE repo.

Can someone comment on how the github repo is updates from the main OE repo?

Philip


