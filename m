Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoUvC-0002ry-US
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 07:22:43 +0200
Received: by eyb7 with SMTP id 7so1065664eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=IcYTwIKFEhGy0yIDyDfTIfU1GpOheIyITxr9EYH6zBs=;
	b=fGANtsaHG8LBI7Op/uTWgFAnh36lRifTeXR2Yo2uGpd89IdNxHTs0ctyojuJ5405Nm
	v/7bkRPE4+OTGVWcPVa8H0kowYAgnDBdkEU2Cj9voN/7ynAF1JcoG1FBTJFCNfikq3To
	OcGFeuiY7Nr0ZXCNEPq+hxvkJn/DTOIGuLWCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=XfaALr8XM8r8qhmuoLhbvGrckU/F9LcF1bxOM098wf5TIGILUx+hHfCtBsO+aXqUDB
	v+1tAu30Vh0Tt9DeYQAtAsjxzTDhtcChRH8NN+4asj+CsbOy6+lZ0BS4wCct7Ezsnhfa
	btF+PgM4hQMnHpHCVVEu7dUlkjspWsP7kQwiM=
MIME-Version: 1.0
Received: by 10.213.14.131 with SMTP id g3mr6306995eba.47.1282800137715; Wed,
	25 Aug 2010 22:22:17 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 22:22:17 -0700 (PDT)
Date: Thu, 26 Aug 2010 11:22:17 +0600
Message-ID: <AANLkTinbTzD_2XfYFxMv9CYrJF7ho0iNCM+b-y4sB5wv@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Native scripts for upstart and other init system
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
X-List-Received-Date: Thu, 26 Aug 2010 05:22:44 -0000
Content-Type: text/plain; charset=UTF-8

Now OpenEmbedded support and include start script only for sysvinit. But
repository include systemd and upstart init system.
This init system use other start script format. Can i'm add support to
OpenEmbedded multiplie start script to package? How i can do it?

