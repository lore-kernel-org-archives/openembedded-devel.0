Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MQSCV-0007RU-M7
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 22:32:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id BAAE82C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:18:45 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWP8Rvu38xzM
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:18:44 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id C763F2C829
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 20:18:43 +0000 (UTC)
Message-ID: <4A5B96D2.8050407@gmail.com>
Date: Mon, 13 Jul 2009 22:19:30 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1MQNDW-0007ur-Rm@melo.openembedded.org>	<200907132005.09088.marcin@juszkiewicz.com.pl>	<20090713185246.GB8275@denix.org>
	<f96d234e0907131307q462bc083h3cf25bfe6d4492fd@mail.gmail.com>
In-Reply-To: <f96d234e0907131307q462bc083h3cf25bfe6d4492fd@mail.gmail.com>
Subject: Re: [oe-commits] Marco Cavallini : Added linux version recipes/linux/linux-2.6. 29 for taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 20:32:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Cliff Brake ha scritto:
> On Mon, Jul 13, 2009 at 2:52 PM, Denys Dmytriyenko<denis@denix.org> wrote:
>> On Mon, Jul 13, 2009 at 08:05:08PM +0200, Marcin Juszkiewicz wrote:
>>> Dnia poniedzia??ek, 13 lipca 2009 o 17:13:22 git version control
>>> napisa??(a):
>>>
>>> Please read CommitPolicy in wiki - first line of commit is summary and
>>> should fit in 7x chars (weekly changelog script cuts at 78 chars) and
>>> next lines are used for description. Also those two changes should be
>>> squashed into one ("git rebase -i origin" would be useful command for
>>> next patch set).
>> Aren't policies required to be read by new developers when git access is
>> granted? There used to be a welcome message sent by Mickey with helpful links
>> to the Wiki. Is it still the case? Just wondering...
> 
> I have not seen such a message, but I suggest that
> http://wiki.openembedded.net/index.php/New_commit_rights be updated to
> contain any relevant information.  I'll start sending a link to this
> page with new commit rights that I add.

Yes, if there are so many rules, would be a good idea to document all
them in a signle place :-)
I did my best updating what is editable :
http://wiki.openembedded.net/index.php/Commit_log_example

/marco



