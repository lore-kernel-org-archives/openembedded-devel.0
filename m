Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NVQAM-0000oE-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:55:18 +0100
Received: (qmail 20747 invoked by uid 1003); 14 Jan 2010 13:53:02 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Jan 2010 13:53:02 -0000
Message-ID: <4B4F21BD.9080901@balister.org>
Date: Thu, 14 Jan 2010 08:53:01 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1263421337.3575.3.camel@dax.rpnet.com>
	<ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
In-Reply-To: <ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC Meeting 7/1/2010
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
X-List-Received-Date: Thu, 14 Jan 2010 13:55:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2010 04:02 AM, Frans Meulenbroeks wrote:

>> Commit messages were mentioned. It should be clear from reading the
>> commit message what the change applies to and why its necessary. The TSC
>> will start naming and shaming people making lousy commit messages and
>> reserve the right to impose sanctions against repeat offenders.
>
> I agree that we want good commit messages.
>
> Some remarks though:
>
> Before publicly naming and shaming people, I would suggest discussing
> it with the offender in private email or on irc.
> Naming and shaming might drive people away from oe.
>
> I suggest that when someone gets commit rights (s)he is explicity
> reminded of http://wiki.openembedded.net/index.php/Commit_Policy and
> http://wiki.openembedded.net/index.php/Commit_log_example
>
> I suggest to review the rules;. E.g. this one:
> # This should all be on one line and you should leave an empty line
> before any detailed commit information.
> Nice, but if you use git commit and enter your message empty lines are removed.
>
> Also i suggest an additional rule that commit messages should be polite.
> E.g. no snide remarks on someone who made an earlier patch or on the
> source package or on the code itself.

The commit messages problem has been an on going issue. For some reason, 
there seems to be a never ending series of commits with not very good 
messages.

People, when you are working with new contributors, encourage them to 
start out using good commit messages so the the problems Frans is 
describing do not crop up.

Project specific branches should also strive to follow the commit 
message form so that changes can easily be merged into the main OE repo.

Philip


