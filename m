Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q5eBQ-0001K5-9w
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 15:14:39 +0200
Received: (qmail 23871 invoked by uid 1003); 1 Apr 2011 13:12:28 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.183.40)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Apr 2011 13:12:28 -0000
Message-ID: <4D95CF3D.9090801@balister.org>
Date: Fri, 01 Apr 2011 09:12:29 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301642773.3951.2.camel@mattotaupa>
In-Reply-To: <1301642773.3951.2.camel@mattotaupa>
Subject: Re: patch queue: latest patches not listed in Patchwork
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
X-List-Received-Date: Fri, 01 Apr 2011 13:14:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2011 03:26 AM, Paul Menzel wrote:
> Dear OE folks,
>
>
> I do not see the latest patches in our patch queue [1]. Is that a known
> problem?

The process that processes the patchwork emails started taking 100% cpu 
yesterday. The admin team had to turn it off so other functions on the 
machine would run.

We need someone who understands enough about patchwork and/or the script 
to figure out why it is stuck and how to fix it.

Any volunteers?

Philip


