Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seth.boll@gmail.com>) id 1T7oLF-0005QX-VT
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Sep 2012 16:06:30 +0200
Received: by obblz20 with SMTP id lz20so7279529obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Sep 2012 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=XjuT9K69hD4TIBdJCxpMozPXoCpUWwpEqnZeb9WaByE=;
	b=OmkY6WeIwwFsAxVIctc0F46/XaSX3sUVUi0KQnrnBobD7DEClJeI5p0mJ3UNOFFrGn
	/5Z4hmIiVVv+cDvzExPyC9oXjeJfot5b3LzIslc5WECIStd9KF0DS35c8MtD5LjmEnk9
	8dU3eBgL/+/3VvUKshdtVoKnwAkjow947nIJnBpHAa3WO9lmwWs32fDpg7+LaPZ1ikZa
	c1aXlZ5v9oTAyCHmYXQzxeAz0Npr0DPAq3ZCX6rmYWOpymYOh+mLKCQSwvENRBwXY0fZ
	zzK4VCirllRtNF1yo1SpK7dn0SXJ/JIr5McJVwWOa2+kHAlAcS1AtIQlqHC91dxjB2kQ
	7l3A==
MIME-Version: 1.0
Received: by 10.60.26.103 with SMTP id k7mr10617159oeg.122.1346507651641; Sat,
	01 Sep 2012 06:54:11 -0700 (PDT)
Received: by 10.76.74.105 with HTTP; Sat, 1 Sep 2012 06:54:11 -0700 (PDT)
Date: Sat, 1 Sep 2012 08:54:11 -0500
Message-ID: <CA+JN8xNsJ-74AP6g30Bmt7u4Qg2PWC46E-s3ZS5_mFKgUhyKSg@mail.gmail.com>
From: Seth Bollinger <seth.boll@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Recipes for building ruby modules (rake, gems, etc.)
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
X-List-Received-Date: Sat, 01 Sep 2012 14:06:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I have a few ruby modules I need to create recipes for.  Are there any that
already exist to run rake and gem building tasks (I need to build C
extensions as well)?  I spent some time looking, but didn't find any.  I
would like to reuse work before trying to roll my own.

Thanks,

Seth

