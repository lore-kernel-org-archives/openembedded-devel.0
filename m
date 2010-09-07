Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Osx17-0001Nh-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:11:14 +0200
Received: by gya6 with SMTP id 6so2099522gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=fkqKFZoSF5CPjtKxiPqzSs8ISZNarQe26zk6Ti7G5TE=;
	b=EQOGbNxHSRrfFNECmotO59GGsWckGhjzpnNhr0ZXydobTbjJhKFUG2EuJTakB6QKJ9
	q6j7MaMPpRizRbrWTg0wCaPtGDlkfA188Ifd3VyNqnlSPQISu7jvj0J5LfGQ0Xg4aGik
	XOvsvg9KKhBWlB3T9yvILJjqOUGNBn9AARWxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kVDo842lG/7GwuEyV8MaS3BX9/ZLOPbjVG6mNkMAubONi/drMRqAi5rUghJgf2iDjm
	bHeedDccfDKi+QgzHfHxnK1Iyex4+8ZleCdg/LbCqvWKa6/e5DSF92n0qo15Z+0ItE6i
	r0XqwGs8NRLz9AWNE8njDUgsyqeUm6xw3SMLk=
MIME-Version: 1.0
Received: by 10.90.35.8 with SMTP id i8mr346059agi.200.1283861431745; Tue, 07
	Sep 2010 05:10:31 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 05:10:31 -0700 (PDT)
Date: Tue, 7 Sep 2010 14:10:31 +0200
Message-ID: <AANLkTinCbuso+UXvq7Ru1ZDAXhMB=Jbx34k-b2RZC-s=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: rd5b3850cb6 openembedded.git/recipes/bash/bash_3.2.bb: bash 3.2: bump PR
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
X-List-Received-Date: Tue, 07 Sep 2010 12:11:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Can we have clearer commit messages please?
The message in the subject line should at least have explained why a
PR bump is needed at all.

See also http://wiki.openembedded.net/index.php/Commit_Policy for the
policy on commit messages.

Thank you!
Frans


