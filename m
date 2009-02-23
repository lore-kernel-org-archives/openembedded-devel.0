Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lbfip-0005Vu-7l
	for openembedded-devel@openembedded.org; Mon, 23 Feb 2009 19:40:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lbffw-0000Jv-N4
	for openembedded-devel@openembedded.org; Mon, 23 Feb 2009 18:37:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 23 Feb 2009 18:37:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 23 Feb 2009 18:37:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Feb 2009 19:36:56 +0100
Message-ID: <gnuqc8$o0m$1@ger.gmane.org>
References: <1235412616.27962.20.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1235412616.27962.20.camel@andromeda>
Sender: news <news@ger.gmane.org>
Subject: Re: mickey/sane-updates-and-defaults
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
X-List-Received-Date: Mon, 23 Feb 2009 18:40:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23-02-09 19:10, Michael 'Mickey' Lauer wrote:
> Hi guys,
>
> I tried to build the minimal distro again after quite a while. I noticed
> we have a bunch of inconsistent default versions in our metadata, which
> we should fix asap. To layout one of several examples: hal 0.5.11 is the
> default which depends on a libvolumeid version which has
> DEFAULT_PREFERENCE = -1.
>
> Ångström users will probably not notice this, since they override a
> large bunch of settings, however I think it's very important to get our
> default set of versions right as well.

Great! The last time I tried that the hatemail flooded my inbox ("Do it 
in your own distro you moron!"), which is why the angstrom configs have 
gotten so big.
Having said all that, please note that there's a subtle difference 
between 'sane defaults' and 'globally hiding bugs'.

regards,

Koen



