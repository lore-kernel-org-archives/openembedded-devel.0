Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5evT-0001Rs-Fz for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:02:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5etS-0000Lm-FQ for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:00:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 16:00:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 16:00:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Apr 2011 15:57:51 +0200
Message-ID: <in4lkv$326$2@dough.gmane.org>
References: <1301642773.3951.2.camel@mattotaupa>
	<4D95CF3D.9090801@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D95CF3D.9090801@balister.org>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Fri, 01 Apr 2011 14:02:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-04-11 15:12, Philip Balister wrote:
> On 04/01/2011 03:26 AM, Paul Menzel wrote:
>> Dear OE folks,
>>
>>
>> I do not see the latest patches in our patch queue [1]. Is that a known
>> problem?
> 
> The process that processes the patchwork emails started taking 100% cpu
> yesterday. The admin team had to turn it off so other functions on the
> machine would run.

Can we have an announcement about that on oe-devel in the future? It
would have saved me a lot of F5'ing in my browser :)


> We need someone who understands enough about patchwork and/or the script
> to figure out why it is stuck and how to fix it.

Did anyone strace the process? If we enable it again, does it behave
normally?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNldnfMkyGM64RGpERAs9bAJ0detDErQaNJOXCfR0EY/kRSHu4ZACdFMt0
pQS5JjeocqJyAzyBpbsG2eQ=
=RtHU
-----END PGP SIGNATURE-----



