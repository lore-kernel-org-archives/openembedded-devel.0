Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TzmvD-0007NM-Us
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 12:30:46 +0100
Received: by mail-oa0-f48.google.com with SMTP id h2so2572940oag.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:cc:content-type;
	bh=C2ZnCBh5wdHbFU3GQEAMDoqUyYZ9LWNqjIObyu34fnQ=;
	b=koFPeUo9B5KxvVt/t4jLXR/6lQzc/X5FinpCq8IqwirO1pDIY6RcIAc338DvHZixLm
	BqUjxQ7MiFozJWC05pw4MUfGqTfPpLcb9K9/kvothWW2PS91UEzZ0YnPanhMBSIKMsAG
	EDOO2agOQwXP3D7gO33mPmWwQXjy//mYOMyXBe2XcZ+Azd//fNuHSy1p5l3lUyOeXMob
	MbIVeDOPXVjziSeeHoQUIrtH4zrqyp2MlHz8+uFOfpY2SHJ8yNbGzqaynA3UuvsDx/hG
	nSV5l6AR6YhP3K0b2Cl2riyhSobo9gko1HOo/qKPqYmnwVhpTxzBixMByuKtEoriu/M4
	YDOw==
MIME-Version: 1.0
X-Received: by 10.182.115.5 with SMTP id jk5mr11016432obb.7.1359371705211;
	Mon, 28 Jan 2013 03:15:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 28 Jan 2013 03:15:05 -0800 (PST)
Date: Mon, 28 Jan 2013 09:15:05 -0200
X-Google-Sender-Auth: cOYTjcEVALezZSFXgy1V31Ra8cw
Message-ID: <CAP9ODKpAe50RUTRqXh9-e+Ag6AUgwCMUT+Ayx=tw18h04jD=+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: [for-danny] Backport to Danny
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
X-List-Received-Date: Mon, 28 Jan 2013 11:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Please apply the following changes into danny branch:

- qconnman-e: fix unpackaged files QA warning
(dbd823cfbfc9f332aa40c4a55affba71807fcb41)

- qconnman: update git repo URL (93581aa61c450e24472f1b1d5bd01fd328a30455)

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


