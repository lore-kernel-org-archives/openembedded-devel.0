Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tim@timwise.co.uk>) id 1P699j-00066m-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:46:42 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id E4ED7460;
	Wed, 13 Oct 2010 17:46:11 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 13 Oct 2010 17:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=message-id:date:from:mime-version:to:cc:subject:content-type:content-transfer-encoding;
	s=smtpout; bh=SzpOrDGZSzttioKFyT1Xev1NOIY=;
	b=hisM9pQDj0WZyLWI2k9U0CxYF1sa0MvmrKR2qmNuz+OmgrZgPODSwG2cbpC1Dq0+FPkfymv1EGMpC+fxBwgdmZ3fEF2SqboEJvU0/HSxPpwX+IW+qQQ/XBSI/Kw3yDg1oK6wez+2owOhnkuH0YYnfmm/3lAo22/04uQYf5NPfa8=
X-Sasl-enc: KcypovmFK4rP4zs72DCIeeParMwVnKegEtg+gQjtxyK+ 1287006371
Received: from [192.168.1.67] (78-86-198-4.zone2.bethere.co.uk [78.86.198.4])
	by mail.messagingengine.com (Postfix) with ESMTPSA id F3BF35E592B;
	Wed, 13 Oct 2010 17:46:10 -0400 (EDT)
Message-ID: <4CB628A0.4040904@timwise.co.uk>
Date: Wed, 13 Oct 2010 22:46:08 +0100
From: Tim Abell <tim@timwise.co.uk>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: Shr-devel <shr-devel@lists.shr-project.org>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: tim@timwise.co.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: SHR-user <shr-user@lists.shr-project.org>,
	openembedded-devel@lists.openembedded.org
Subject: [SHR-T] let's make shr-t happen again!
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
X-List-Received-Date: Wed, 13 Oct 2010 21:46:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello to all potential and existing maintainers, shr-u devs, 
administrators, package maintainers, application programmers etc,

I really want to breath life back into shr-testing.

Firstly, does anyone else want to help me as a co-maintainer? Let me know!

I've written down most of my thoughts on what needs to be done and how 
it can/should be done here: 
http://www.shr-project.org/trac/wiki/ShrMaintainerHowTo Some of you have 
seen already (though I keep adding to it).

I'm finding it quite tough getting to a point of being productive, so I 
thought this would be a good point to ask the whole community for a bit 
of help.

I would like to invite people to join in a brain storm on the mailing 
list. What do you think needs to be done, how do you think we can 
practically do it? What resources are available to us and how do we 
access them? I really want to reach for the stars in terms of quality so 
I want to know what you think is the *best* approach, and then what 
compromises we might make till we outstrip android in user base and 
development power ;^D

Reply with your thoughts and ideas and I'll collate them for the wiki. 
Anything you have that will help me get moving will be greatly 
appreciated. I really want to encourage a community approach; I'm 
willing to put the effort in to make it happen all by myself, but I also 
want to make sure anyone else can take over or join in with as little 
problems as possible.

Finally and very importantly, are you a potential user of shr-testing? 
If so what do *you* want out of it? (I just want less regressions.) What 
hardware would you run it on? Would you be able to test beta versions of 
shr-t?

Thank you all reading,

Tim Abell

---

Apologies for cross-posting - I want to gain as much feedback as 
possible from all aspects of the shr community, including the upstream 
openembedded project people.




