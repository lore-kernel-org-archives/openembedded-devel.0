Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UJ3FS-00088K-4w
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 15:47:19 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A1D7EF811F8; Fri, 22 Mar 2013 08:30:19 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2E154F811F1;
	Fri, 22 Mar 2013 08:30:19 -0600 (MDT)
Message-ID: <514C6AFC.1050405@mlbassoc.com>
Date: Fri, 22 Mar 2013 08:30:20 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAHu+ux18fZzDuBjYj_d8r9P=y=khrCSjuRjKPKG9RzxEAO2vXw@mail.gmail.com>
In-Reply-To: <CAHu+ux18fZzDuBjYj_d8r9P=y=khrCSjuRjKPKG9RzxEAO2vXw@mail.gmail.com>
Subject: Re: Adding a recipe to oe bitbake
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
X-List-Received-Date: Fri, 22 Mar 2013 14:47:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-03-22 08:24, David Hirst wrote:
> Hi,
>      I have been struggling with a oe/bitbake issue. I wanted to add an
> other .bb to the image file.
> I have tried multiple ways but always end up at the same spot. I have
> created a new task-XXX.bb file which includes my bb
> I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.
> Once built I find that everything built fine and the new recipe was built
> but was not loaded into the XXXX-rootfs-image.tar,gz.
> If I look into the image directory for the bb file I see the compiled
> application in usr/sbin.
> I have tried this with my own .bb file and net-snmp bb file which comes
> with the default oe-layersetup installation with the same result.
> Did I not edit a file or miss some other required step?
>

Wow, the same question on three mailing lists (that I read, there
may be more...) and no cross-posting!

This list is perhaps the most appropriate one for your question.

More details will help.  Exactly what did you change in the "XXXX-rootfs-image.bb"
recipe?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


