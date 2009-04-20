Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Lw2K4-0008JA-DI
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 00:50:46 +0200
Received: by gxk28 with SMTP id 28so2823704gxk.12
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=XnOJm2WtrSlzEYd+3XvI1ZE9ZXnXw7iZSNSgW7AU7D8=;
	b=m6W3FxZWhjkYT944rui3aHyPug4vKPnDQE7UKj4Mz1HUzYAYML6jehZ+OCnP/O5Gwn
	AtB1l6o5BS0dBNVu4bOJCSY/UtQHrObhkymbcphEmiPSYj44CgQ/aYS/FOnVSQUX7UHf
	dOkGPHnUlJfT6QPFnG5ehCv7Q1hFarkwWF/oI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Liyux2hWeQIRuUFkYtfeBah3GByM4gJzC4/NKyEcoxSDXRzyuhjpRqtSO6zAIBSBmS
	8JLhv79CV4MKwdivyz6SLlldBnpt4NW1UWTBtrHJfSVF2nYP3SV8iMyw2OakHcoQM3gI
	rZp/AF0UKiK5jlrQD/a3Nj5aUpggQuSrxKSKY=
MIME-Version: 1.0
Received: by 10.90.67.6 with SMTP id p6mr8017957aga.25.1240267324160; Mon, 20 
	Apr 2009 15:42:04 -0700 (PDT)
Date: Tue, 21 Apr 2009 00:42:04 +0200
Message-ID: <c384c5ea0904201542y7d6de263ve1de19745ed29d47@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@openembedded.org
Subject: Reflection on MTN to GIT change?
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
X-List-Received-Date: Mon, 20 Apr 2009 22:50:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

just wanted to see how we feel about the move to git as our scm?

Personally, I like the speed of git, I like the very healthy commit
rate we have in OE now*. Still struggling with the concept of git
though.
Overall, a good move I think.

Thanks for everyone who did the hard work of setting up the services
(git, patchwork, ...) and supporting tools.

Regards,
-- 
Leon


