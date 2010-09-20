Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OxhuY-0001Jt-V2
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 17:04:07 +0200
Received: by eyb7 with SMTP id 7so1683086eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=48EgcptacpudG2tk7UhoaP+0ycjb4/vBAjs0nif1YXo=;
	b=j6ij9tFW9Lmy+6I6KYFc5JQ0MqcJvrzLHcnF7cqLZ5p92J3X07ODcYNyRQoXnx7e6D
	c7MvwL1wvR5Awt9ksI04ezh0lU1nRWt8F3WIHZJlnDvKE/+qJAdDFfX0ylDOARgoJhpw
	NmNWYqDBmYfzAXJ1F/Xm22kL4L0RMvq9sh0Mk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=pLUcpyqdzV+MqKK7Cc8b0oI7DCNGxJ3tEtJFU/88nZ9lPxS8zNvSJShTwGn/ZPCO5f
	UtoijPuXejNDXEhh94ste3tL21NcNJ69facMRoOcfDlRPe9vFesolHwrdGNL9NdIXcDD
	RodEjZsdjn+wnAUVYtFcD8bPzPJhKXsf+PBFM=
MIME-Version: 1.0
Received: by 10.216.17.130 with SMTP id j2mr4469917wej.47.1284995044854; Mon,
	20 Sep 2010 08:04:04 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 20 Sep 2010 08:04:04 -0700 (PDT)
Date: Mon, 20 Sep 2010 11:04:04 -0400
Message-ID: <AANLkTinCaVa9jTmv4ysnbszv0-nyn3nwqYrQKAr2hLWE@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-09-20
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
X-List-Received-Date: Mon, 20 Sep 2010 15:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

testing-next has been updated to latest master and is ready for clean
builds.  Seems like we had a number of issues last week, so I will
likely not move the testing branch forward unless others think we
should.

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-13

Note, we had a bogus commit in the testing-next branch, so I did a
forced update.  If you already have a testing-next branch locally, you
might do the following to get in sync.

git fetch
git checkout testing-next
git reset --hard origin/testing-next

http://wiki.openembedded.net/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


