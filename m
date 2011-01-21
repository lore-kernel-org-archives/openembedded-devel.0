Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PgF4v-0002jv-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:22:53 +0100
Received: from [192.168.1.135] (188-195-80-208-dynip.superkabel.de
	[188.195.80.208])
	by dd20204.kasserver.com (Postfix) with ESMTP id 4B792180445E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:22:13 +0100 (CET)
Message-ID: <4D396C5B.4050800@opensimpad.org>
Date: Fri, 21 Jan 2011 12:22:03 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D36F9BE.1010601@xora.org.uk> <4D373EDB.1070200@balister.org>
In-Reply-To: <4D373EDB.1070200@balister.org>
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Fri, 21 Jan 2011 11:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.01.2011 20:43, Philip Balister wrote:
>
> We should also have some discussion on the process for getting stuff=20
> into -core and how devs get commit access. Basically, we need to think =

> about how to integrate the OpenEmbedded people and the Yocto people.
>

First of all I am not against a pull based model. But in my opinion we=20
should start a poll to decide the commit model for core. Afterwards if=20
we agree that a pull based model is well suited for core we should do=20
another poll to decide who will be the "king". We should also have some=20
rules for how to change the king. Also the king should only rule for a=20
limited time. After this time period there should be another poll. In my =

opinion this will help people to accept what the king decides. We also=20
need rules for rejects of pull requests. They should have a technical=20
reason. The king should also be responsible for security issues. If I=20
got it right yocto has full-time developers so one should do full-time=20
security stuff for core.

I know we have the TSC but a poll does not hurt. I belief that most=20
developers will agree with the pull based model.

best regards
Bernhard



