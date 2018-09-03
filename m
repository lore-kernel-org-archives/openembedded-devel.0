Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5CF751AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 15:49:16 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id t5-v6so1023757qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2018 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Wwr7LEpd/68p0TXP7ZT17ifoVirzdsNVFFjPcLzG0so=;
	b=LRlUjG+L0sP8jQhGKtXy6YmzAsOTh5PI1KfAPUJLDdhLXV9toWKHo8kuyksetvg3n9
	i7PQOzwTkMAIWYUS9f4ZAUAuUaYpvzkMQCRvnk1tmRjxivaB3oG4cFyZmWGr0XU9kUKL
	tbY3jz0m01lzmyny7dyjDbW7FEFN3XefGjxQuE/hwzZUtafKdHzBOfPm+aFhpkb5ohWl
	O4NWe0WsBwZWwMfbgQhqD7XCny/+W4ocO+b15X0pfPmRmkKBslhZJWD4YA/4LsZYy9gb
	dVnB4SDzLVuRtwkVd5Ph5B+HPNi/GaRC8Ba/JaaOKgKfET5f5is1x/qWB9/sR9OVJHUf
	m+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Wwr7LEpd/68p0TXP7ZT17ifoVirzdsNVFFjPcLzG0so=;
	b=WkRcMw80pDx1HAkpMC2JbYS/lkJjAj79ZXuwDzB/6otUXO3eZwz/zmXaBojqIC8CNI
	l/0ySOSjY6D3Gru9QtpW0dMvkQ+Rbj6AAHDLV7Ni9jdfh4aFGtSLqzHf0kKbdxhj1jvI
	418+WX1Txv/VLS+IhCRlEmZzUgtEpZVHUsXRoway8gPqExCGBYPBsY8KSmIRCFkl8ofJ
	Kp6mVgNe+w0iDEez+OPPk+MJ+mji42bSoRJD8JU4lWuxbXgJmWik7pR6v4a9tEAsxOTs
	n4OUuaHxP1TyUZ0UiOWLqJjrgJZkRSmVhu5L4xrUk3XKmVArrFXHX5ZHmYONCyJih4Gq
	pgHA==
X-Gm-Message-State: APzg51DhxJY9KNb0/+TzaUafKvCWX0oAthgC8TGwdrMrbTQzII7ON3eT
	f7uBV750k2H/+0mGEXV7SXwrhN1Rm7SXci0dWKyXN0rN
X-Google-Smtp-Source: ANB0VdbMMLabbpiPGGMbHn17J2zXet5Tbj5/JoWMn62p/Tk9iCvzLNlcqGZ3bfvt8umzdiLy6jEpH3Fvcwq9St+4R7U=
X-Received: by 2002:aed:2807:: with SMTP id r7-v6mr2409702qtd.2.1535989757306; 
	Mon, 03 Sep 2018 08:49:17 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Mon, 3 Sep 2018 17:49:06 +0200
Message-ID: <CAGCTLNRznucdB5dQqzKfT0DBp=_=Sio1ykFERH9teK9T9GdXOw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [openembedded][qt5] : Text is hidden in Qt5 apps
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 15:49:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
I built custom image based on wayland instead of x11
it support Qt5 apps.
I built simple Qt5 app and tried to build it for the custom image to run it
there.
the application is work but the text is hidden !
The same for the test app "Qt5_Cinematicexperience"
No text at all for all films.

Thanks,


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

